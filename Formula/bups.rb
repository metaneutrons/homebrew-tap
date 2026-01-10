class Bups < Formula
  desc "USB print server for label printers"
  homepage "https://github.com/metaneutrons/bups"
  version "0.1.0"
  license "GPL-3.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/bups/releases/download/v0.1.0/bups-0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "dccee6c2bb7e879b98e2b555df4e7cea787cdd1c8bde9cf509e2f66d1a927d92"
    else
      url "https://github.com/metaneutrons/bups/releases/download/v0.1.0/bups-0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "b1877d3d5c378fb1d5a9d33913c04622ca3b1b16da9143ecd58f24f87900598a"
    end
  end

  def install
    bin.install "bups"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bups --version")
  end
end
