class UgosCli < Formula
  desc "CLI and MCP server for UGREEN NAS (UGOS) management"
  homepage "https://github.com/metaneutrons/ugos-cli"
  license "GPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.23.0/ugos-cli-x86_64-apple-darwin.tar.gz"
      sha256 "c00115e07dbe5a35947ca789ef4a448f20b1f77fabec4be47b3a62cf8ae23125"
    else
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.23.0/ugos-cli-aarch64-apple-darwin.tar.gz"
      sha256 "38d76f7634c2f9af1302196ac960d8ac33a98b1600db520f99385596bf4fab4c"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.23.0/ugos-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "66797cf8ac7d48d36322093b4311e79665e42591f08e4cf7a73cf8b97611c240"
    else
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.23.0/ugos-cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2683dceaf51cb8f8fd2ae7e73d5565ebda77618a5b55c4a123a60ddfdb2acfdc"
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
