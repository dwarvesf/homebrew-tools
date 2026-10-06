cask "share-bar" do
  version "0.9.0"
  sha256 "193a480a5b10ac90bb64c96b96fadb5f51114a1d3e306593a0dd74eec11f62d9"

  url "https://github.com/dwarvesf/share/releases/download/v0.9.0/Share-Bar-0.9.0.zip"
  name "Share Bar"
  desc "Menu bar app for share: live status, quick links, drag-to-publish"
  homepage "https://github.com/dwarvesf/share"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on formula: "dwarvesf/tools/share"
  depends_on macos: :ventura

  app "Share Bar.app"

  uninstall quit: "foundation.d.share.bar"

  zap trash: "~/Library/Preferences/foundation.d.share.bar.plist"
end
