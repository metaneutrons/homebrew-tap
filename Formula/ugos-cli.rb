class UgosCli < Formula
  desc "CLI and MCP server for UGREEN NAS (UGOS) management"
  homepage "https://github.com/metaneutrons/ugos-cli"
  license "GPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.14.2/ugos-cli-x86_64-apple-darwin.tar.gz"
      sha256 "679a8489eb6d672552db031032c524c6e7e2fd7143b21d1d83f7161d499dac41"
    else
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.14.2/ugos-cli-aarch64-apple-darwin.tar.gz"
      sha256 "51991fc42576eb348f5a68cac648bac17a6b5b2076fbb1803faaa7a22787c89c"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.14.2/ugos-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a507b7df0362ecc53e185663733ab333ebf9942783e6bad7bfa2377923afcb24"
    else
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.14.2/ugos-cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6dc07aeb815e7e696ff9b73de562d03053f99511d50494d147f86546c3b80ce6"
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
