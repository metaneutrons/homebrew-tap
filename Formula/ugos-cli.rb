class UgosCli < Formula
  desc "CLI and MCP server for UGREEN NAS (UGOS) management"
  homepage "https://github.com/metaneutrons/ugos-cli"
  license "GPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.15.0/ugos-cli-x86_64-apple-darwin.tar.gz"
      sha256 "70a9127fc23c89842852f11971806ff2683097fa4b992fcd94d0dd248363c7ad"
    else
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.15.0/ugos-cli-aarch64-apple-darwin.tar.gz"
      sha256 "83c5e250d874194c90cf6c679f0e74819284c9e7a04d0c0196c142dc51a3e742"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.15.0/ugos-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9a51dd75fb8ded32dc3183f1920022de7a6cb4ba6ca87b47a802815a5e0767b1"
    else
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.15.0/ugos-cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8aff641deecbc9eb0846522063fd002c214eaca639e4055d8cf472e323b56dde"
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
