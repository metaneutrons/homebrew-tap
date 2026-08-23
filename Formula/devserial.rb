class Devserial < Formula
  desc "MCP server bridging serial hardware to LLMs"
  homepage "https://github.com/metaneutrons/devserial-mcp"
  version "0.1.3"
  license "GPL-3.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/devserial-mcp/releases/download/devserial-v0.1.3/devserial-0.1.3-x86_64-apple-darwin.tar.gz"
      sha256 "5fe4cdadabf09529594a11fb857ed70231fbce29c60bd3441267633b8e1ce8f0"
    else
      url "https://github.com/metaneutrons/devserial-mcp/releases/download/devserial-v0.1.3/devserial-0.1.3-aarch64-apple-darwin.tar.gz"
      sha256 "9cdbc013fcdddf6fa5a07800bd949ce082ea11a889a9f0da0f1e764f38f3bc64"
    end
  end

  def install
    bin.install "devserial"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/devserial --version")
  end
end
