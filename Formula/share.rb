class Share < Formula
  desc "Publish snapshots of local files at a short link on your own domain"
  homepage "https://github.com/dwarvesf/share"
  url "https://github.com/dwarvesf/share/archive/refs/tags/v0.6.0.tar.gz"
  sha256 "27400167532afccd6c0c001c94fd7b72303af783429dd1eb5904433e9ffab5eb"
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
