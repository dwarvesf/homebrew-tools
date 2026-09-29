cask "share-bar" do
  version "0.7.0"
  sha256 "593a719e229fa833931705fa3eee278e33b935460041f7b285390eefaf3341f5"

  url "https://github.com/dwarvesf/share/releases/download/v0.7.0/Share-Bar-0.7.0.zip"
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
