cask "spacedown" do
  version "1.0.2"
  sha256 "30aa969e3911921cfeae3834aa4a085aa6901fd87bef58283aecffc280a187ae"

  url "https://github.com/dwarvesf/spacedown/releases/download/v#{version}/Spacedown-#{version}-macos.zip"
  name "Spacedown"
  desc "Quick Look preview for Markdown files"
  homepage "https://github.com/dwarvesf/spacedown"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :ventura"

  app "Spacedown.app"

  zap trash: [
    "~/Library/Containers/foundation.d.spacedown",
    "~/Library/Containers/foundation.d.spacedown.quicklook",
  ]
end
