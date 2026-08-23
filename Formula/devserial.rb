class Devserial < Formula
  desc "MCP server bridging serial hardware to LLMs"
  homepage "https://github.com/metaneutrons/devserial-mcp"
  version "0.1.3"
  license "GPL-3.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/devserial-mcp/releases/download/v0.1.3/devserial-0.1.3-x86_64-apple-darwin.tar.gz"
      sha256 "2c20aaad919a76176353f200efd0c06d594c4ae43743ff4f082f8053222cb370"
    else
      url "https://github.com/metaneutrons/devserial-mcp/releases/download/v0.1.3/devserial-0.1.3-aarch64-apple-darwin.tar.gz"
      sha256 "558225df1542d757736461c960fd04d751aa4a342aad522475c6f319d4efc757"
    end
  end

  def install
    bin.install "devserial"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/devserial --version")
  end
end
