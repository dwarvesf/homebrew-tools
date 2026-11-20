# dwarvesf/homebrew-tools

Homebrew tap for tools from [Dwarves Foundation](https://github.com/dwarvesf).

```sh
brew install dwarvesf/tools/<formula>
```

| Formula | What it does |
|---|---|
| [handout](https://github.com/consolelabs/handout) | Moved to [consolelabs/homebrew-tap](https://github.com/consolelabs/homebrew-tap): `brew install consolelabs/tap/handout`. `brew update` moves an existing install (also one named `share`) there (`tap_migrations.json`). |

```sh
brew install --cask dwarvesf/tools/<cask>
```

| Cask | What it does |
|---|---|
| [handout-bar](https://github.com/consolelabs/handout) | Moved to [consolelabs/homebrew-tap](https://github.com/consolelabs/homebrew-tap): `brew install --cask consolelabs/tap/handout-bar`. |
| [spacedown](https://github.com/consolelabs/spacedown) | Moved to [consolelabs/homebrew-tap](https://github.com/consolelabs/homebrew-tap): `brew install --cask consolelabs/tap/spacedown`. `brew update` moves an existing install there (`tap_migrations.json`). |

## Releasing a new version

1. Tag and release the tool (for example `gh release create v0.2.0` in its repo).
2. Update `url` and `sha256` in `Formula/<name>.rb` (or `version` and `sha256` in `Casks/<name>.rb`): `curl -sL <tarball-url> | shasum -a 256`.
3. Open a PR here. CI audits the formula and installs it on macOS.
