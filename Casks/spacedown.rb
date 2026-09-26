cask "spacedown" do
  version "1.0.1"
  sha256 "32f8c4177539fd8f38309795a3250d2c435b54632dc783154be8063f23d129b9"

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
