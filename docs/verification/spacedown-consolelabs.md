# spacedown-consolelabs

Cask `url` and `homepage` move from dwarvesf/spacedown to consolelabs/spacedown after the repo transfer.

```bash
curl -sIL -o /dev/null -w '%{http_code}\n' https://github.com/consolelabs/spacedown/releases/download/v1.1.0/Spacedown-1.1.0-macos.zip
```

Command: curl -sIL -o /dev/null -w '%{http_code}' https://github.com/consolelabs/spacedown/releases/download/v1.1.0/Spacedown-1.1.0-macos.zip
Exit: 0
Output: 200
Verdict: PASS

Command: gh pr checks 31
Exit: 0
Output: cask pass 50s (audit, install, spctl check on the consolelabs url); formula pass 1m14s, run 44516178747 with the added `brew trust dwarvesf/tools` step
Verdict: PASS
