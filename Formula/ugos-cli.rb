class UgosCli < Formula
  desc "CLI and MCP server for UGREEN NAS (UGOS) management"
  homepage "https://github.com/metaneutrons/ugos-cli"
  license "GPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.27.0/ugos-cli-x86_64-apple-darwin.tar.gz"
      sha256 "ddb9f1f77b623e4398a797880e1c771939cc5b359b1e5dac652c25333b128fee"
    else
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.27.0/ugos-cli-aarch64-apple-darwin.tar.gz"
      sha256 "bc94f1e98add3519b213e8a294b4f0810849fb3868f3d98a67fddca56f476e42"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.27.0/ugos-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b61b06ee48a82fbe199b33b3adee31f75212a00d45dceb2f1ce1f14424df045a"
    else
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.27.0/ugos-cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2676924131269e962de6fcc4ea293e3a499462c8e9b5ba2d7b924a2bc5da5030"
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
