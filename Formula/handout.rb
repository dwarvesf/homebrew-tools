class Handout < Formula
  desc "Hand out files, folders, and dev servers at a link on your own domain"
  homepage "https://github.com/consolelabs/handout"
  url "https://github.com/consolelabs/handout/archive/refs/tags/v0.9.0.tar.gz"
  sha256 "4054d1fc62e2c9c6ea08dbe98279fee55ddb5cd02fcd775fb91986671c9d3b6e"
  license "MIT"
  head "https://github.com/consolelabs/handout.git", branch: "main"

  depends_on "caddy"
  depends_on "cloudflared"
  depends_on "jq"

  def install
    # releases before the rename ship bin/share only
    src = File.exist?("bin/handout") ? "bin/handout" : "bin/share"
    bin.install src => "handout"
    # existing scripts and login services call share
    bin.install_symlink "handout" => "share"
  end

  def caveats
    <<~EOS
      Next: handout setup s.example.com
        A browser opens for the Cloudflare login; handout does the rest,
        including a login service that keeps your links up.
        The share command still works: it is the same program.

      Menu bar app: brew install --cask dwarvesf/tools/handout-bar
        Installs Handout Bar, a menu bar app that shows your links and status.

      Optional: brew install pandoc gh
        pandoc renders handed-out markdown to HTML; gh warns when a
        handout comes from a private GitHub repo.
    EOS
  end

  test do
    assert_match "setup", shell_output("#{bin}/handout --help")
    assert_equal shell_output("#{bin}/handout --help"), shell_output("#{bin}/share --help")
    ENV["SHARE_ROOT"] = testpath/"root"
    ENV["SHARE_CONFIG_DIR"] = testpath/"config"
    shell_output("#{bin}/handout ls")
  end
end
