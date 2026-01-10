class Bups < Formula
  desc "USB print server for label printers"
  homepage "https://github.com/metaneutrons/bups"
  version "0.1.0"
  license "GPL-3.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/bups/releases/download/v0.1.0/bups-0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "b8a5dddee1e4d5eda0d4d161d489759b75f81a7c263315df4d9fb41ec6a62cb1"
    else
      url "https://github.com/metaneutrons/bups/releases/download/v0.1.0/bups-0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "e191c49fec86429cc12a24c023eb25eb44667a288accf132c8d6cd98573fed29"
    end
  end

  def install
    bin.install "bups"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bups --version")
  end
end
