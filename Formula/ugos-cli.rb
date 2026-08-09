class UgosCli < Formula
  desc "CLI and MCP server for UGREEN NAS (UGOS) management"
  homepage "https://github.com/metaneutrons/ugos-cli"
  version "0.3.4"
  license "GPL-3.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.3.4/ugos-cli-x86_64-apple-darwin.tar.gz"
      sha256 "93605e0f0a13a671407119864d3bf01465e3ca726c8ec75e918e641c968d16b0"
    else
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.3.4/ugos-cli-aarch64-apple-darwin.tar.gz"
      sha256 "1326ac10449d74deda9ed65f750f29152a9e1ca6fdefa948d478cbcba9c08246"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.3.4/ugos-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5b83f36b7b80ea095ee88826d903827924e4dbbfb7198ed603d67f0c4abffdef"
    else
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.3.4/ugos-cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "df7cc0ccff179b8cc570db8ca0554b999431726d5b9f8066470b3105bcac430c"
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
