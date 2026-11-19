# Verification -- spacedown-consolelabs

The cask `url` and `homepage` point at consolelabs/spacedown after the repo transfer, and CI trusts the tap before auditing (current Homebrew refuses untrusted taps).

## Green run
```
Command: gh pr checks 31
Exit: 0
Output:
cask	pass	50s	(brew audit --cask --strict --online, brew install --cask, spctl check on the app from the consolelabs url)
formula	pass	1m14s
Verdict: PASS
```
Run 44516178747. The cask url alone: `curl -sIL https://github.com/consolelabs/spacedown/releases/download/v1.1.0/Spacedown-1.1.0-macos.zip` returned 200.

## Negative control
```
Command: gh run view 44515319759 --log-failed
Exit: 0
Output:
Refusing to load cask dwarvesf/tools/spacedown from untrusted tap dwarvesf/tools.
Run `brew trust --cask dwarvesf/tools/spacedown` or `brew trust dwarvesf/tools` to trust it.
Refusing to load formula dwarvesf/tools/share from untrusted tap dwarvesf/tools.
Verdict: PASS (same workflow without the trust step is RED; with it, GREEN)
```
Run 44515319759 is the same branch before the `brew trust dwarvesf/tools` step was added.

## Not proven
- Real users' `brew install --cask` from the public tap; CI covers the same command on a runner.
