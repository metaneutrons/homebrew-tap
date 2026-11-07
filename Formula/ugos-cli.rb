class UgosCli < Formula
  desc "CLI and MCP server for UGREEN NAS (UGOS) management"
  homepage "https://github.com/metaneutrons/ugos-cli"
  license "GPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.22.0/ugos-cli-x86_64-apple-darwin.tar.gz"
      sha256 "ed0ea4625338f421308d558ecbc908c5915b03aae992571d80e225379c20d3d1"
    else
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.22.0/ugos-cli-aarch64-apple-darwin.tar.gz"
      sha256 "39df22533a196c9dbd4de17e5ab16308fcc32d39c421863c2e04b2a89369618a"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.22.0/ugos-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "58662e960fecffa06f104e7c39c5e222dd272b084634bffebb3f18bd444f7157"
    else
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.22.0/ugos-cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f75bcd4addd6c4b5105ab74c8ba2eae99f3e065ed01e23a65cd887af24c87a58"
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
