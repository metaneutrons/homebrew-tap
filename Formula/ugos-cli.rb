class UgosCli < Formula
  desc "CLI and MCP server for UGREEN NAS (UGOS) management"
  homepage "https://github.com/metaneutrons/ugos-cli"
  license "GPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.13.2/ugos-cli-x86_64-apple-darwin.tar.gz"
      sha256 "52d73f6e56d83722eb822f6bd79ccc2c2433ffac6a8fc24210ab10083820b344"
    else
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.13.2/ugos-cli-aarch64-apple-darwin.tar.gz"
      sha256 "3e5a7082897de3d97c9ea8033d171c35f77b5cdd09833ccae2f66f00d0ad3748"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.13.2/ugos-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "10455e8c8c108e9057548bd2a7ddbf22a66d8590faab0822a736ec1d221d4f81"
    else
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.13.2/ugos-cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3fdf9fe1379e7122e94ac22d9cd47808adc864f4256f67fd5a024a9477a97077"
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
