# robustness-of-SNP-heritability

> ⚠️ 本仓库代码位于 `reference_code/`，是 2020 年前后读博期间的历史实现，仅作参考与溯源，不代表当前可用状态；新的开发请另建目录（如 `src/`），不要直接改这里的文件。

## 这个项目研究什么

这个项目研究当模型假设被 G×E、G×G 交互或非正态性状破坏时，SNP 遗传力估计是否仍然稳健。关注对象包括 GREML/LMM 与 RDR 两类估计思路。

## 方法/数据

现有工作以 GCTA、GREML/LMM 的小规模测试为主，辅以 lasso 与 RDR 的方法学探索；尚未形成系统的模拟数据或实证分析。

## 当前状态

只有探索性测试脚本和初步构想，系统的压力测试、模拟设计与统一分析流程都尚未完成。

## 代码地图

- `reference_code/heritability-research/`：GCTA/LMM 测试及探索性回归脚本。
