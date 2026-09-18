# dwarvesf/homebrew-tools

Homebrew tap for tools from [Dwarves Foundation](https://github.com/dwarvesf).

```sh
brew install dwarvesf/tools/<formula>
```

| Formula | What it does |
|---|---|
| [share](https://github.com/dwarvesf/share) | Publish snapshots of local files and folders at a short link on your own domain, through a Cloudflare Tunnel. |

## Releasing a new version

1. Tag and release the tool (for example `gh release create v0.2.0` in its repo).
2. Update `url` and `sha256` in `Formula/<name>.rb`: `curl -sL <tarball-url> | shasum -a 256`.
3. Open a PR here. CI audits the formula and installs it on macOS.
