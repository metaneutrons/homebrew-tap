class Devserial < Formula
  desc "MCP server bridging serial hardware to LLMs"
  homepage "https://github.com/metaneutrons/devserial-mcp"
  version "0.1.3"
  license "GPL-3.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/devserial-mcp/releases/download/devserial-v0.1.3/devserial-0.1.3-x86_64-apple-darwin.tar.gz"
      sha256 "dd2b728a25834ccc4f965006ba351570dfb722e246efe687b38f39347282febd"
    else
      url "https://github.com/metaneutrons/devserial-mcp/releases/download/devserial-v0.1.3/devserial-0.1.3-aarch64-apple-darwin.tar.gz"
      sha256 "1f166249f48bc7fb87ced4516cef5b232abca35d579431d9f25398f8719aebba"
    end
  end

  def install
    bin.install "devserial"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/devserial --version")
  end
end
