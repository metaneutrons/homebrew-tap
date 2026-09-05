class UgosCli < Formula
  desc "CLI and MCP server for UGREEN NAS (UGOS) management"
  homepage "https://github.com/metaneutrons/ugos-cli"
  license "GPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.13.1/ugos-cli-x86_64-apple-darwin.tar.gz"
      sha256 "6ed0877e66b70b85c50a2954aa664f88d8afd326a16b69f91e5811a4d050ed73"
    else
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.13.1/ugos-cli-aarch64-apple-darwin.tar.gz"
      sha256 "ca117a7cdb0e7898e0f445df0b8e3e5874fc142058660c5f45231f721a4c3163"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.13.1/ugos-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5ea492d83bc21fb3b7bc365b0ae8175a35911ba1abe92df21bcbd1903bdc9e7f"
    else
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.13.1/ugos-cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5c3e5c2aa70ad1a8633d435e3607238f2ccc88367dc021c7f4d2be79fc065fba"
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
