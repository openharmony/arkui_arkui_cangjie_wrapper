# CLAUDE.md

本仓库的编码代理指引统一维护在 [AGENTS.md](./AGENTS.md)，请先完整阅读并遵循。

知识库位于 `docs/`（索引：`docs/README.md`），技能位于 `.claude/skills/`：

- 新增/修改组件 API：使用 skill `cangjie-component-api-design`
- 修改 `foreign` 函数或 `@C` 结构体：使用 skill `cangjie-ffi-signature-sync`
