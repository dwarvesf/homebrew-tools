cask "share-bar" do
  version "0.8.0"
  sha256 "a909809548926dcb3f1077b505f126f4aef1101ee8779653ce739f931d40605d"

  url "https://github.com/dwarvesf/share/releases/download/v0.8.0/Share-Bar-0.8.0.zip"
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
