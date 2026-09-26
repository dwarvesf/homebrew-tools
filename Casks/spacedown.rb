cask "spacedown" do
  version "1.0.3"
  sha256 "bd49d144b336d4a3e4e2595e58917ab1b7a28abc6de06124f8b83110bbf62a28"

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
