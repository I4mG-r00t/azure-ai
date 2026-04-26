# MCP Security Notes

Rules:

- Do not give every MCP server full filesystem access.
- Use separate MCP profiles per workflow.
- Do not store secrets in `.mcp.json`.
- Prefer Docker isolation for risky tools.
- Keep forensic evidence read-only where possible.
- Log important actions.
