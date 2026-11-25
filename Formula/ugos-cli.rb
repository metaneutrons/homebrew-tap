class UgosCli < Formula
  desc "CLI and MCP server for UGREEN NAS (UGOS) management"
  homepage "https://github.com/metaneutrons/ugos-cli"
  license "GPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.26.0/ugos-cli-x86_64-apple-darwin.tar.gz"
      sha256 "90dd53074140b7a71725ad6f6266b9daa715f4e1f89530f6868b38b0cff5676d"
    else
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.26.0/ugos-cli-aarch64-apple-darwin.tar.gz"
      sha256 "55e3288587c08218340c1d408ac4e45671760db608bdee5f9a4c25777d29a888"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.26.0/ugos-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "dc6049550258da631ac522858e4c02c6a8000edf16e0cf502efc2e71d3ed7d4b"
    else
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.26.0/ugos-cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "723f03d39d3ef995f9ee29c9bf8719bb7c3844fa3bf5f4a3f6280837a6d62353"
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
