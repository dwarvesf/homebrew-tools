# Verification: spacedown-moved

The spacedown cask moves to consolelabs/tap. This tap drops `Casks/spacedown.rb`, adds `tap_migrations.json` so `brew update` moves existing installs, drops the CI cask job (it only covered spacedown), and points the README row at the new tap. The handout formula is untouched.

## Green run
```
Command: export HOMEBREW_NO_AUTO_UPDATE=1; brew tap consolelabs/tap; brew trust --cask consolelabs/tap/spacedown; brew info --cask consolelabs/tap/spacedown
Exit: 0
Output:
Tapped 1 cask (16 files, 14.4KB).
Trusted cask: consolelabs/tap/spacedown
==> spacedown (Spacedown): 1.1.0
From: https://github.com/consolelabs/homebrew-tap/blob/HEAD/Casks/spacedown.rb
Verdict: PASS (the new home resolves before this PR removes the old one)
```

```
Command: actionlint && python3 -c 'import json;assert json.load(open("tap_migrations.json"))["spacedown"]=="consolelabs/tap"'
Exit: 0
Output: (no output)
Verdict: PASS
```

The consolelabs/homebrew-tap CI audited, installed and spctl-checked the cask on its PR (run 44580612498, success).

## Negative control
```
Command: actionlint && python3 -c 'import json;assert json.load(open("tap_migrations.json"))["spacedown"]=="consolelabs/tap"'
Mutation: printf '{"spacedown": "dwarvesf/tools"}' >| tap_migrations.json
Exit: 1 (under mutation)
Output: AssertionError
Restore: git checkout HEAD -- tap_migrations.json
Exit: 0 (green after restore)
Verdict: RED, as expected
```
