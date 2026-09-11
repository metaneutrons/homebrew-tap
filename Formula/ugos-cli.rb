class UgosCli < Formula
  desc "CLI and MCP server for UGREEN NAS (UGOS) management"
  homepage "https://github.com/metaneutrons/ugos-cli"
  license "GPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.14.3/ugos-cli-x86_64-apple-darwin.tar.gz"
      sha256 "2c42e027e7d81fb9633bfb3086a0d7e2b1e9e32184ff3dbc63e4dd4fc3855f69"
    else
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.14.3/ugos-cli-aarch64-apple-darwin.tar.gz"
      sha256 "a8c1822e5044e9669b2462f4bee2aec248641ffb87e4e13a90bcd80d44fcd6e0"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.14.3/ugos-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "27f94596ec385de03cdf7bcdea59d6ecb8d4b047ab12011dc794f6310f9761bc"
    else
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.14.3/ugos-cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a44d66e7f0e2351cddf8d3b1c97eee74a0d4bb6c868096ffd568aa4257741a84"
    end
  end

  def install
    bin.install "ugos-cli"
    bin.install "ugos-mcp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ugos-cli --version")
  end
end
