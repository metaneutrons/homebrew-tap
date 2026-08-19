class UgosCli < Formula
  desc "CLI and MCP server for UGREEN NAS (UGOS) management"
  homepage "https://github.com/metaneutrons/ugos-cli"
  version "0.10.1"
  license "GPL-3.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.10.1/ugos-cli-x86_64-apple-darwin.tar.gz"
      sha256 "1dbd917a8d531ec47af88e432cc9acc062fdd7dda7855663c7dd06c03d3f32bf"
    else
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.10.1/ugos-cli-aarch64-apple-darwin.tar.gz"
      sha256 "ef1b9abec8946e6ca34d8710853f9c651d67e7ebb61d2ce29afa2de232ef5ee9"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.10.1/ugos-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "29128b5be710b1beb2ac8a11583271676d5f946d5177e5f05047da26d26e588d"
    else
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.10.1/ugos-cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d074bbde650bf7de5946f47d57bf07514e69c568fe32d80abea211f84770d981"
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
