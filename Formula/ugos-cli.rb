class UgosCli < Formula
  desc "CLI and MCP server for UGREEN NAS (UGOS) management"
  homepage "https://github.com/metaneutrons/ugos-cli"
  version "0.10.0"
  license "GPL-3.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.10.0/ugos-cli-x86_64-apple-darwin.tar.gz"
      sha256 "c8fd33bc73054f74ccc4dd35ca74e7da25a20f2a1f8e9445faebab3d7211d196"
    else
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.10.0/ugos-cli-aarch64-apple-darwin.tar.gz"
      sha256 "19832db9a42140a995909b2fe448763c8dfcd36da7d2eece619fd7a7adb1d7ee"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.10.0/ugos-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "43300a2d60559c48c02f3a77648a135a41d30edc2d7cabe67d7399285914198f"
    else
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.10.0/ugos-cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "34aa12d32632df780eb2a85b437051ba3329c430166287920666c178dea130bc"
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
