# Verification: handout-moved

The handout formula and the handout-bar cask move to consolelabs/tap (consolelabs/homebrew-tap#4). This tap drops both files and adds `tap_migrations.json` entries so `brew update` moves existing installs, including ones still named `share` and `share-bar`. With no formula left, the CI job now checks that every map parses and points at consolelabs/tap.

## Green run
```
Command: brew trust --formula consolelabs/tap/handout; HOMEBREW_NO_AUTO_UPDATE=1 brew info consolelabs/tap/handout
Exit: 0
Output:
Trusted formula: consolelabs/tap/handout
==> consolelabs/tap/handout: stable 0.9.0, HEAD
Publish files, folders, and dev servers at a link on your own domain
Verdict: PASS (the new home resolves before this PR removes the old one)
```

```
Command: the CI maps check (python3, as in .github/workflows/ci.yml)
Exit: 0
Output:
maps ok
Verdict: PASS
```
consolelabs/homebrew-tap#4 CI audited both, installed the formula and ran `brew test` (formula pass, cask pass). Homebrew reads a `"share": "consolelabs/tap/handout"` entry through `Tap.with_formula_name` (formulary.rb), which splits the tap from the new name.

## Negative control
```
Command: the same maps check
Mutation: printf '{"handout": "dwarvesf/tools"}' >| tap_migrations.json
Output: AssertionError: {'handout': 'dwarvesf/tools'}
Restore: the saved copy; the check prints maps ok again
Verdict: RED, as expected
```

## Rollback
Revert this PR: both files come back and the four migration entries go. An install that `brew update` already moved stays on consolelabs/tap, which keeps working.

## Not proven
- A real `brew update` moving a `dwarvesf/tools/handout` keg to consolelabs/tap on a user machine.
