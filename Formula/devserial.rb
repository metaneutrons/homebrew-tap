class Devserial < Formula
  desc "MCP server bridging serial hardware to LLMs"
  homepage "https://github.com/metaneutrons/devserial-mcp"
  version "0.1.4"
  license "GPL-3.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/devserial-mcp/releases/download/devserial-v0.1.4/devserial-0.1.4-x86_64-apple-darwin.tar.gz"
      sha256 "bd086c6974b27d94bf8f74d4d1d471220393db1b0dcfb8417e69eaccbbfbf31d"
    else
      url "https://github.com/metaneutrons/devserial-mcp/releases/download/devserial-v0.1.4/devserial-0.1.4-aarch64-apple-darwin.tar.gz"
      sha256 "f84b6d9e7257d2f7a03a4e28bd3a9a185958926f608edba9836d35935ac2e5a9"
    end
  end

  def install
    bin.install "devserial"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/devserial --version")
  end
end
