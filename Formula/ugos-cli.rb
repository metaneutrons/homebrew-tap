class UgosCli < Formula
  desc "CLI and MCP server for UGREEN NAS (UGOS) management"
  homepage "https://github.com/metaneutrons/ugos-cli"
  license "GPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.14.0/ugos-cli-x86_64-apple-darwin.tar.gz"
      sha256 "c3a86dab1468ca9c061a36ca92817ae3f6da586ee85fdf7cf1d6c92f12fef94b"
    else
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.14.0/ugos-cli-aarch64-apple-darwin.tar.gz"
      sha256 "2ddc599030c440e19688aba3db9e56a35db1f903819e8ef95dc7b478e3d9252b"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.14.0/ugos-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2d6ca55f7280dc7be56c57d6ccf006be6179a26348c914c1c86e5e0db0c5ba70"
    else
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.14.0/ugos-cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1862f178e109591983b830414a05ba6f22a22a0dd046505ded9089b6d01b527e"
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
