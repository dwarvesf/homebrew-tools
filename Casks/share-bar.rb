cask "share-bar" do
  version "0.7.1"
  sha256 "e4bb0b5cc4f2333e410d45cd667e8ace329cafe314b7aab6df570d34091e1ca2"

  url "https://github.com/dwarvesf/share/releases/download/v0.7.1/Share-Bar-0.7.1.zip"
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
