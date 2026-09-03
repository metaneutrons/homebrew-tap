class UgosCli < Formula
  desc "CLI and MCP server for UGREEN NAS (UGOS) management"
  homepage "https://github.com/metaneutrons/ugos-cli"
  license "GPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.11.0/ugos-cli-x86_64-apple-darwin.tar.gz"
      sha256 "698777c8ead6a453dfa985a96fc42031f17e0b58f59ade8f7d2f048f3147b911"
    else
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.11.0/ugos-cli-aarch64-apple-darwin.tar.gz"
      sha256 "3ab283a0d134b0bca24d5488e963552c23dadcf13a9bf2f8ba1c81cfea69c468"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.11.0/ugos-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8581ffed86c8f10827d95e76a7c02687253c2401ecb559b85dbdf60cb95d3aeb"
    else
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.11.0/ugos-cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "51ff4c0b35981deb84fc9e509533e9eca1f4b5d07d1e96b7481e81efd59d1c84"
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
