class UgosCli < Formula
  desc "CLI and MCP server for UGREEN NAS (UGOS) management"
  homepage "https://github.com/metaneutrons/ugos-cli"
  license "GPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.24.0/ugos-cli-x86_64-apple-darwin.tar.gz"
      sha256 "efceb1811aa664a4921937ce33f91037279c893e5d5dabf5e4c9435561be6a1c"
    else
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.24.0/ugos-cli-aarch64-apple-darwin.tar.gz"
      sha256 "6fd3d9a8d7de38d2d3785f67e3559bd1f259d6849950c58338bc879fd32a00b0"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.24.0/ugos-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1902bef97d165889dbd6b99cc2182c9de7de894269204d4a8ddeeb63284d72d5"
    else
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.24.0/ugos-cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a2c4c1afe26b2194c151b3aee69588ec3014a788185fbb39c4db5ca05d67235f"
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
