# CI Cost Hints for Diatonic-AI/diatonic-ai-prompts

Failed runs (window): 8

## Longest failing jobs (minutes)
-   0.12m  SEO Validation  labels=['ubuntu-latest']  run=https://github.com/Diatonic-AI/diatonic-ai-prompts/actions/runs/17183587976
-   0.12m  Update Site Statistics  labels=['ubuntu-latest']  run=https://github.com/Diatonic-AI/diatonic-ai-prompts/actions/runs/17170074414
-    0.1m  Dependency Updates  labels=['ubuntu-latest']  run=https://github.com/Diatonic-AI/diatonic-ai-prompts/actions/runs/17367492191
-    0.1m  Accessibility Check  labels=['ubuntu-latest']  run=https://github.com/Diatonic-AI/diatonic-ai-prompts/actions/runs/17183587976
-    0.1m  Update Site Statistics  labels=['ubuntu-latest']  run=https://github.com/Diatonic-AI/diatonic-ai-prompts/actions/runs/17144389390
-   0.08m  Performance Audit  labels=['ubuntu-latest']  run=https://github.com/Diatonic-AI/diatonic-ai-prompts/actions/runs/17367492191
-   0.08m  Security Scan  labels=['ubuntu-latest']  run=https://github.com/Diatonic-AI/diatonic-ai-prompts/actions/runs/17367492191
-   0.08m  Update Site Statistics  labels=['ubuntu-latest']  run=https://github.com/Diatonic-AI/diatonic-ai-prompts/actions/runs/17057917256
-   0.07m  Update Site Statistics  labels=['ubuntu-latest']  run=https://github.com/Diatonic-AI/diatonic-ai-prompts/actions/runs/17115448885
-   0.05m  Update Site Statistics  labels=['ubuntu-latest']  run=https://github.com/Diatonic-AI/diatonic-ai-prompts/actions/runs/17086882624

## Recommendations
- Add concurrency + cancel-in-progress to long-lived workflows (prevents duplicate runs)
- Add on:push paths filters to skip docs-only or non-code changes
- Consider scheduled workflows cadence (weekly/monthly instead of daily)
- Increase cache hit rates (setup-node/setup-python + actions/cache with lockfiles)
- Timeouts: set step/job-level timeouts to prevent runaway costs
- Reduce matrix size or shard by priority (nightly full matrix, PRs minimal)
