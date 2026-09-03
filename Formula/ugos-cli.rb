class UgosCli < Formula
  desc "CLI and MCP server for UGREEN NAS (UGOS) management"
  homepage "https://github.com/metaneutrons/ugos-cli"
  license "GPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.11.2/ugos-cli-x86_64-apple-darwin.tar.gz"
      sha256 "66910bb39f09342c529e08339f1a6715b99baf6d366c2c75df16a5f91cc2adcd"
    else
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.11.2/ugos-cli-aarch64-apple-darwin.tar.gz"
      sha256 "a81afc5ee025184f6d0e1d96ffb6b00faff5ccc8d3bf2006423c6892058e0cc9"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.11.2/ugos-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1d29f6f1c9f0de51cb0b1c4b4e3bce61a9dddba247cceb5c74861fe049ead9fd"
    else
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.11.2/ugos-cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "80c461a6a9bdfc4701ffec878e85286a6edeaceb0bcdff082bc1a70f9bf2c6bf"
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
