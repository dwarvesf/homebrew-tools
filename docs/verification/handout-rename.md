# Verification -- handout-rename

The formula `share` becomes `handout` and the cask `share-bar` becomes `handout-bar`, after the repo moved to consolelabs/handout. Rename maps move existing installs. The formula still installs `share`, because login services call `/opt/homebrew/bin/share serve`.

## Green run
```
Command: curl -sL https://github.com/consolelabs/handout/archive/refs/tags/v0.9.0.tar.gz | shasum -a 256, compared with the sha256 in Formula/handout.rb
Exit: 0
Output:
formula=4054d1fc…ff8c9d3b6e archive=4054d1fc…ff8c9d3b6e
MATCH
Verdict: PASS
```
Digests are shortened here; the full value is in `Formula/handout.rb`. The cask url `https://github.com/consolelabs/handout/releases/download/v0.9.0/Share-Bar-0.9.0.zip` returned HTTP 200. The tarball holds `handout-0.9.0/bin/share`, which the install block installs as `handout` with a `share` symlink. CI (brew audit, install, test of `dwarvesf/tools/handout`) runs on this PR.

## Negative control
```
Command: the old Formula/share.rb sha256 compared with the same archive
Exit: 0
Output:
OLD-MISMATCH old=0ace56c3…f64647834a
Verdict: PASS (the old formula's sha is RED against the renamed archive, so the sha bump is required)
```
The archive's top folder changed from `share-0.9.0` to `handout-0.9.0`, so the checksum changed.

## Not proven
- A real `brew update` migrating an installed `share` to `handout` on a user machine; Homebrew reads `formula_renames.json` for that.
- `Handout Bar.app`: the 0.9.0 zip still holds `Share Bar.app` until the next release.
