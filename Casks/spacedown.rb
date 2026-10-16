cask "spacedown" do
  version "1.1.0"
  sha256 "05c6be35a9e7c2d230f7a4ac5b12a345266e06976d1e9f7241cdd7aa9aaa5be7"

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
