class Devserial < Formula
  desc "MCP server bridging serial hardware to LLMs"
  homepage "https://github.com/metaneutrons/devserial-mcp"
  version "0.1.3"
  license "GPL-3.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/devserial-mcp/releases/download/devserial-v0.1.3/devserial-0.1.3-x86_64-apple-darwin.tar.gz"
      sha256 "49334e6c7c74c0fcde7ac6471c60c7bacca874505d300baf04c15dc164119f15"
    else
      url "https://github.com/metaneutrons/devserial-mcp/releases/download/devserial-v0.1.3/devserial-0.1.3-aarch64-apple-darwin.tar.gz"
      sha256 "f0f2616a36710519dd4b1824b5cf8830327a264191fce3386612c4ed83e4101f"
    end
  end

  def install
    bin.install "devserial"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/devserial --version")
  end
end