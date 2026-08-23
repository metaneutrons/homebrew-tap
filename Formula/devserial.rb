class Devserial < Formula
  desc "MCP server bridging serial hardware to LLMs"
  homepage "https://github.com/metaneutrons/devserial-mcp"
  version "0.1.3"
  license "GPL-3.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/devserial-mcp/releases/download/v0.1.3/devserial-0.1.3-x86_64-apple-darwin.tar.gz"
      sha256 "9b7986daf040b51af770369176e18c21afff31cd22c9dea75a34fcd4bf7aa798"
    else
      url "https://github.com/metaneutrons/devserial-mcp/releases/download/v0.1.3/devserial-0.1.3-aarch64-apple-darwin.tar.gz"
      sha256 "ec281c55f86acabc3c72402f6e7557e8718ac72903732aa07be74582f0b725e2"
    end
  end

  def install
    bin.install "devserial"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/devserial --version")
  end
end
