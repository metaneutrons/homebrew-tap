class UgosCli < Formula
  desc "CLI and MCP server for UGREEN NAS (UGOS) management"
  homepage "https://github.com/metaneutrons/ugos-cli"
  license "GPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.21.0/ugos-cli-x86_64-apple-darwin.tar.gz"
      sha256 "05bfd0f38f28e39c39deeec539542e55234fec7352c5b89a4dededf0aa2d418c"
    else
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.21.0/ugos-cli-aarch64-apple-darwin.tar.gz"
      sha256 "e06b7ec47b15313c560a9be0569fe28c5c7bdb242e9b287f0199f8a4ada8224a"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.21.0/ugos-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3f2ee977bfbed03e5eeb29a88a95e31429d52359dce8b35326d02cb5a922d465"
    else
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.21.0/ugos-cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "34c5835e040ce42d73477451c1bdf9a045afcb44c2a83af4add85282b6683c13"
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
