cask "share-bar" do
  version "0.6.0"
  sha256 "48d9f7ab0ed15ac7f1abf9decb0a1ffcd0bc26d5cf7e11943bfcd00579f988d4"

  url "https://github.com/dwarvesf/share/releases/download/v0.6.0/Share-Bar-0.6.0.zip"
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
