class UgosCli < Formula
  desc "CLI and MCP server for UGREEN NAS (UGOS) management"
  homepage "https://github.com/metaneutrons/ugos-cli"
  license "GPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.19.0/ugos-cli-x86_64-apple-darwin.tar.gz"
      sha256 "486df4ed56feb7fc32c5c5bb8200b45ee92894b93cbcce988a81a33dc56c9dec"
    else
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.19.0/ugos-cli-aarch64-apple-darwin.tar.gz"
      sha256 "c27367fc0ff52aa7a4438efcde8d2517122198293ff19957cb5b391d7be80f85"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.19.0/ugos-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "58bdf5775f8810819155898536dc763571318b02d193b5983a249fc56139c1bf"
    else
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.19.0/ugos-cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "fe467c42f4a18141530579d393917ca9ceab83dd939fdaf8351c35c81bb94c01"
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
