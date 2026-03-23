# homebrew-agent-corex

Homebrew tap for [agent-corex](https://github.com/ankitpro/agent-corex) — the MCP tool router for AI agents.

---

## Install

```bash
brew tap ankitpro/agent-corex
brew install agent-corex
```

No Python required — the formula installs a self-contained binary.

---

## What is agent-corex?

`agent-corex` is a CLI tool that:

- **Detects** Claude Desktop, Cursor, VS Code, VS Code Insiders, and VSCodium
- **Injects** the Agent-Corex MCP gateway as a single entry point into all detected tools
- **Manages** MCP servers — browse the marketplace, install, update, and toggle servers
- **Routes** tool calls through a semantic search layer, cutting context tokens by ~60%

```bash
# Authenticate
agent-corex login --key acx_your_key

# Detect installed AI tools
agent-corex detect

# Inject into Claude Desktop, Cursor, VS Code, etc.
agent-corex init

# Browse and install MCP servers
agent-corex registry
agent-corex install-mcp github

# Run health diagnostics
agent-corex doctor
```

---

## Other Install Methods

Homebrew is the easiest way on macOS/Linux, but agent-corex is also available as:

| Method | Command / Link |
|--------|---------------|
| **Direct binary — macOS arm64** | `curl -fsSL https://github.com/ankitpro/agent-corex/releases/latest/download/agent-corex-macos-arm64 -o /usr/local/bin/agent-corex && chmod +x /usr/local/bin/agent-corex` |
| **Direct binary — Linux x86_64** | `curl -fsSL https://github.com/ankitpro/agent-corex/releases/latest/download/agent-corex-linux-x86_64 -o /usr/local/bin/agent-corex && chmod +x /usr/local/bin/agent-corex` |
| **Windows .exe** | [Download from releases](https://github.com/ankitpro/agent-corex/releases/latest/download/agent-corex-windows-x86_64.exe) |
| **pip** | `pip install agent-corex` |

---

## Supported Platforms

| Platform | Binary |
|----------|--------|
| macOS arm64 (M1/M2/M3) | `agent-corex-macos-arm64` |
| macOS x86_64 (Intel via Rosetta 2) | `agent-corex-macos-arm64` (same binary) |
| Linux x86_64 | `agent-corex-linux-x86_64` |
| Windows x86_64 | `agent-corex-windows-x86_64.exe` |

---

## Updating

```bash
brew update
brew upgrade agent-corex
```

The formula is auto-updated on every release via `update-homebrew-tap.yml` in the main repo.

---

## Manual formula update

```bash
VERSION=1.2.0
sed -i '' "s/version \".*\"/version \"$VERSION\"/" Formula/agent-corex.rb
# Replace the sha256 values from the GitHub release .sha256 sidecar files
git commit -am "agent-corex $VERSION"
git push
```

---

## Tap automation (maintainers)

The `update-homebrew-tap.yml` workflow in the main repo patches this formula automatically after each release. It needs:

- A PAT with `repo` scope saved as `TAP_GITHUB_TOKEN` in the main repo's Actions secrets
- This repo to be accessible with that token

---

## Links

- Main repo: [github.com/ankitpro/agent-corex](https://github.com/ankitpro/agent-corex)
- PyPI: [pypi.org/project/agent-corex](https://pypi.org/project/agent-corex/)
- Releases: [github.com/ankitpro/agent-corex/releases](https://github.com/ankitpro/agent-corex/releases)
- Issues: [github.com/ankitpro/agent-corex/issues](https://github.com/ankitpro/agent-corex/issues)
