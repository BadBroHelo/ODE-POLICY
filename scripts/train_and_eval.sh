#!/usr/bin/env bash
# Train every supported policy on each LIBERO training suite, then evaluate.
# Run after scripts/prepare_libero_data.sh.
#
# Examples:
#   bash scripts/train_and_eval.sh
#   TRAIN_SUITE=libero_spatial POLICIES="ode fm_dit" bash scripts/train_and_eval.sh
#   EVAL_EVERY_CHECKPOINT=1 bash scripts/train_and_eval.sh
#   RUN_TAG=bs64 NUM_EPOCHS=50 bash scripts/train_and_eval.sh
#
# Defaults evaluate the newest checkpoint on all four individual LIBERO suites.
# Set EVAL_EVERY_CHECKPOINT=1 to evaluate every saved checkpoint instead.
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "${REPO_ROOT}"

DEFAULT_POLICIES="ode ode_dit fm_dit fm_unet a2a_dit a2a ddpm_dit ddpm_unet ddim_unet mars act"
read -r -a POLICIES <<< "${POLICIES:-${DEFAULT_POLICIES}}"
TRAIN_SUITE="${TRAIN_SUITE:-libero_4suite}"

NUM_EPOCHS="${NUM_EPOCHS:-100}"
EVAL_EPISODES="${EVAL_EPISODES:-20}"
EVAL_EVERY_CHECKPOINT="${EVAL_EVERY_CHECKPOINT:-0}"
RUN_TAG="${RUN_TAG:-all_libero}"
RUN_ID="${RUN_TAG}_$(date +%Y%m%d_%H%M%S)"
BATCH_SIZE="${BATCH_SIZE:-128}"
if [[ ${#POLICIES[@]} -eq 0 ]]; then
    echo "POLICIES must contain at least one item" >&2
    exit 2
fi

case "${TRAIN_SUITE}" in
    libero_4suite|libero_spatial|libero_object|libero_goal|libero_10) ;;
    *) echo "unsupported training suite: ${TRAIN_SUITE}" >&2; exit 2 ;;
esac

for policy in "${POLICIES[@]}"; do
    case " ${DEFAULT_POLICIES} " in
        *" ${policy} "*) ;;
        *) echo "unsupported policy: ${policy}" >&2; exit 2 ;;
    esac
done

for policy in "${POLICIES[@]}"; do
    run_name="${policy}_${RUN_ID}"
    echo
    echo "=== train policy=${policy}, run=${run_name}, train_suite=${TRAIN_SUITE}, epochs=${NUM_EPOCHS} ==="
    bash scripts/train_libero.sh "${policy}" "${TRAIN_SUITE}" \
        "policy_name=${run_name}" \
        "train_config.training_params.num_epochs=${NUM_EPOCHS} " \
        "train_config.dataloader.batch_size=${BATCH_SIZE} " \
        "dataset_config.batch_size=${BATCH_SIZE} "

    checkpoint_dir="il_outputs/${run_name}/${TRAIN_SUITE}/checkpoints"
    shopt -s nullglob
    checkpoints=("${checkpoint_dir}"/*.ckpt)
    shopt -u nullglob
    if [[ ${#checkpoints[@]} -eq 0 ]]; then
        echo "no checkpoints found in ${checkpoint_dir}" >&2
        exit 1
    fi

    mapfile -t checkpoints < <(printf '%s\n' "${checkpoints[@]}" | sort -V)
    if [[ "${EVAL_EVERY_CHECKPOINT}" == "1" ]]; then
        eval_checkpoints=("${checkpoints[@]}")
    else
        eval_checkpoints=("${checkpoints[-1]}")
    fi

    for checkpoint in "${eval_checkpoints[@]}"; do
        echo "=== evaluate ${checkpoint} on all LIBERO suites (${EVAL_EPISODES} episodes/task) ==="
        bash scripts/eval_libero.sh "${checkpoint}" all "${EVAL_EPISODES}"
    done
done

echo
echo "=== all requested training and evaluation runs finished ==="
