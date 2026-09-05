class UgosCli < Formula
  desc "CLI and MCP server for UGREEN NAS (UGOS) management"
  homepage "https://github.com/metaneutrons/ugos-cli"
  license "GPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.13.1/ugos-cli-x86_64-apple-darwin.tar.gz"
      sha256 "6ee9ee5865bddf79c8292640d1490ce15e9d3a3c8c2d8875c2fc624939a6441f"
    else
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.13.1/ugos-cli-aarch64-apple-darwin.tar.gz"
      sha256 "71f582503549ae8d39d49bfc6e58a063f9e5a46d8870cbf03620c3e932eac082"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.13.1/ugos-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ef94f203ec7b4c6e43d9663cb43b50118dfcf291991976a8645c959cbb061582"
    else
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.13.1/ugos-cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8d1d1da2a688167939ed4cff6655d193f2d22ffe296155d23cc9db9b1d99c62a"
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
