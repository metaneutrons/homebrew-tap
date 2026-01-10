class Bups < Formula
  desc "USB print server for label printers"
  homepage "https://github.com/metaneutrons/bups"
  version "0.1.1"
  license "GPL-3.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/bups/releases/download/v0.1.1/bups-0.1.1-x86_64-apple-darwin.tar.gz"
      sha256 "27ceb89948c115cffd10f632491f9247b7012d97c9682c4961494e4266661b80"
    else
      url "https://github.com/metaneutrons/bups/releases/download/v0.1.1/bups-0.1.1-aarch64-apple-darwin.tar.gz"
      sha256 "ced72072f1433609670fa85951e4e0ea706bf0798615eadb1ecac06d7065fa25"
    end
  end

  def install
    bin.install "bups"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bups --version")
  end
end
