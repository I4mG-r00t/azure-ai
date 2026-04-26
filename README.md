# Azure AI 

This project builds a reproducible Azure-based AI security lab for: 

- Forensics
- Penetration testing

- Reverse engineering
- Claude CLI / Claude Code
- MCP servers
- Remote access through Tailscale


## Goals

- Fully reproducible infrastructure
- Portable between Azure accounts
- Managed with Terraform
- Tooling managed through scripts and configuration
- Secure remote access without exposing SSH/RDP publicly

## Structure

- `terraform/` - Azure infrastructure
- `cloud-init/` - VM bootstrap configuration
- `scripts/` - Installation scripts
- `mcp/` - MCP server profiles
- `docker/` - Tool containers
- `docs/` - Architecture and operating notes
