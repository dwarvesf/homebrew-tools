cask "spacedown" do
  version "1.0.0"
  sha256 "eff7564338c44870482a7f9edb2bcf3613b4b034afaf06a330492eec7c867a54"

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
