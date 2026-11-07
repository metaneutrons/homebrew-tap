class UgosCli < Formula
  desc "CLI and MCP server for UGREEN NAS (UGOS) management"
  homepage "https://github.com/metaneutrons/ugos-cli"
  license "GPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.18.0/ugos-cli-x86_64-apple-darwin.tar.gz"
      sha256 "5ebb6c8edc0d02b32c8a709905b77c0ba4453231344ab0bcc29262c38b34dd90"
    else
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.18.0/ugos-cli-aarch64-apple-darwin.tar.gz"
      sha256 "c0158062ea2ef48b7b14ed89d9e8593105d2110304d985a37a0b6724d7f60a66"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.18.0/ugos-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "81f93a859794b5f2d5642590afec48ff3594b595de4e47a52dd277e83015a8ff"
    else
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.18.0/ugos-cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3a53de1a86bbb2fe6cea7f742695aa9c7bb6e20115c9edc735fd9ddf72bbd9a5"
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
