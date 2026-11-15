# Wiki Documentation Summary

Generated: 2026-11-13 06:16:33
Repository: ODE-POLICY
Commit: `7482a1fc56332e2c3318ba3eb3d0b92adda9a469`

## Generation Status

**Overall Status**: ⚠️ Content complete; Mermaid syntax validation unavailable

| Metric | Expected | Actual | Status |
|--------|----------|--------|--------|
| Pages | 6 | 6 | ✅ |
| Sections | 17 | 17 | ✅ |
| Citations | - | 149 | ✅ |
| Diagrams | 7 | 7 present, 0 validated | ⚠️ |

## Page Details

| Page | Title | Sections | Citations | Diagrams | Status |
|------|-------|----------|-----------|----------|--------|
| 01_overview.md | 项目概览 | 2/2 | 16 | 1 | ✅ |
| 02_getting_started.md | 安装与复现实验 | 3/3 | 16 | 1 | ✅ |
| 03_training.md | 训练流程与运行器 | 3/3 | 35 | 2 | ✅ |
| 04_ode_policy.md | ODE Policy 与流匹配 | 3/3 | 27 | 1 | ✅ |
| 05_data.md | 数据集与预处理 | 3/3 | 28 | 1 | ✅ |
| 06_libero.md | LIBERO 与 LIBERO-Plus 评测 | 3/3 | 27 | 1 | ✅ |

## Source Coverage

### Covered Files

- `README.md` - cited in 01_overview.md
- `docs/REPRODUCE.md` - cited in 02_getting_started.md, 04_ode_policy.md, 06_libero.md
- `ode_policy/configs/policy_config/ode.yaml` - cited in 03_training.md, 04_ode_policy.md
- `ode_policy/configs/policy_config/ode_dit.yaml` - cited in 04_ode_policy.md
- `ode_policy/configs/train_config/default_train.yaml` - cited in 03_training.md
- `ode_policy/datasets/base_dataset.py` - cited in 05_data.md
- `ode_policy/datasets/robot_image_dataset.py` - cited in 05_data.md
- `ode_policy/datasets/robot_image_dataset_knn.py` - cited in 05_data.md
- `ode_policy/libero/bench_policy.py` - cited in 06_libero.md
- `ode_policy/libero/eval_ode_policy.py` - cited in 06_libero.md
- `ode_policy/libero/hdf5_to_zarr.py` - cited in 05_data.md
- `ode_policy/libero/libero_dataset.py` - cited in 05_data.md
- `ode_policy/libero/libero_env.py` - cited in 06_libero.md
- `ode_policy/libero/libero_eval_runner.py` - cited in 06_libero.md
- `ode_policy/libero/libero_plus_eval_runner.py` - cited in 06_libero.md
- `ode_policy/libero/libero_train_runner.py` - cited in 03_training.md
- `ode_policy/libero/summarize_eval.py` - cited in 06_libero.md
- `ode_policy/policies/ode/ode_image_policy.py` - cited in 04_ode_policy.md
- `ode_policy/runners/base_runner.py` - cited in 03_training.md
- `ode_policy/train.py` - cited in 01_overview.md, 03_training.md
- `ode_policy/utils/flow/base_flow_matcher.py` - cited in 04_ode_policy.md
- `ode_policy/utils/flow/consistency_flow_matcher.py` - cited in 04_ode_policy.md
- `ode_policy/utils/flow/flow_matchers.py` - cited in 04_ode_policy.md
- `ode_policy/utils/flow/mean_flow_matcher.py` - cited in 04_ode_policy.md
- `ode_policy/utils/models/flow_net.py` - cited in 04_ode_policy.md
- `ode_policy/utils/normalizer.py` - cited in 05_data.md
- `ode_policy/utils/replay_buffer.py` - cited in 05_data.md
- `pyproject.toml` - cited in 01_overview.md
- `scripts/eval_libero.sh` - cited in 06_libero.md
- `scripts/setup_env.sh` - cited in 02_getting_started.md
- `scripts/train_libero.sh` - cited in 02_getting_started.md, 05_data.md

## Issues

### Errors

None

### Warnings

- Mermaid CLI (`mmdc`) is not installed, so the 7 diagrams were not syntax-validated. See `mermaid_invalid.json`.

### Recommendations

- None - documentation looks good!
