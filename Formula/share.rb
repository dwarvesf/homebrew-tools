class Share < Formula
  desc "Publish snapshots of local files at a short link on your own domain"
  homepage "https://github.com/dwarvesf/share"
  url "https://github.com/dwarvesf/share/archive/refs/tags/v0.5.1.tar.gz"
  sha256 "c1ac464bcbd9e7ee6528d00e8606d97f409158addf2465825043483212082ca5"
  license "MIT"
  head "https://github.com/dwarvesf/share.git", branch: "main"

  depends_on "caddy"
  depends_on "cloudflared"
  depends_on "jq"

  def install
    bin.install "bin/share"
  end

  def caveats
    <<~EOS
      Next: share setup s.example.com
        A browser opens for the Cloudflare login; share does the rest,
        including a login service that keeps your links up.

      Optional: brew install pandoc gh
        pandoc renders shared markdown to HTML; gh warns when a share
        comes from a private GitHub repo.
    EOS
  end

  test do
    assert_match "share setup", shell_output("#{bin}/share --help")
    ENV["SHARE_ROOT"] = testpath/"root"
    ENV["SHARE_CONFIG_DIR"] = testpath/"config"
    assert_match "no shares", shell_output("#{bin}/share ls")
  end
end
