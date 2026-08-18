class UgosCli < Formula
  desc "CLI and MCP server for UGREEN NAS (UGOS) management"
  homepage "https://github.com/metaneutrons/ugos-cli"
  version "0.7.0"
  license "GPL-3.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.7.0/ugos-cli-x86_64-apple-darwin.tar.gz"
      sha256 "69246c103c516d324f0f3dccbc80ddc7a357f5d910f1ef76cc784f7f11086c98"
    else
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.7.0/ugos-cli-aarch64-apple-darwin.tar.gz"
      sha256 "3c66471173e4f6e451c1b763847453391836dbf49b44535bb317876bcd966ffb"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.7.0/ugos-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c7299a8ac20974154a2600820d49745a3e759360ded7d2ad588706653366dc17"
    else
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.7.0/ugos-cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c4214dc7510f4b5471d092faa4d8cbc608526af12f06c76e860691f46659d4bb"
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
