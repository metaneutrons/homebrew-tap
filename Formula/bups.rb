class Bups < Formula
  desc "USB print server for label printers"
  homepage "https://github.com/metaneutrons/bups"
  version "0.1.0"
  license "GPL-3.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/bups/releases/download/v0.1.0/bups-0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "9e3d54118334e1e8a4de064bac5731286647036d0213f18e04ff355cd211a775"
    else
      url "https://github.com/metaneutrons/bups/releases/download/v0.1.0/bups-0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "4a437669c86b99ea4c09017ea0a90c8979264ae7e438f9a2998b3d16891d0895"
    end
  end

  def install
    bin.install "bups"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bups --version")
  end
end
