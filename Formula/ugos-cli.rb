class UgosCli < Formula
  desc "CLI and MCP server for UGREEN NAS (UGOS) management"
  homepage "https://github.com/metaneutrons/ugos-cli"
  license "GPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.25.0/ugos-cli-x86_64-apple-darwin.tar.gz"
      sha256 "9c0fbfd3fce7ef4d3c8ae5a3ba685b8f71593bf0011fae4e4011b17cd55904d5"
    else
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.25.0/ugos-cli-aarch64-apple-darwin.tar.gz"
      sha256 "9e28ce04c36ecd55c0cf2cfb41726577923e077e08508b32c0b6a0eebbe820ac"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.25.0/ugos-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3301e3f359aebc39a1a4336bdedb0732f1cd1ccde55ff4d9866038d3520e656d"
    else
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.25.0/ugos-cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d6a7602c298a5fff8c4a1f2c0659559d5861749ebc1292e80334c5e8c9cd6207"
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
