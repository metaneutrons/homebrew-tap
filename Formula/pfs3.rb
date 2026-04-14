class Pfs3 < Formula
  desc "PFS3 (Amiga Professional File System III) tools"
  homepage "https://github.com/metaneutrons/pfs3"
  version "0.1.0"
  license "LGPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/pfs3/releases/download/v0.1.0/pfs3-0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "6ca78d668403b302ecc949c0b64a3980b7a98be63894f8c400d55fa9424bd3bf"
    else
      url "https://github.com/metaneutrons/pfs3/releases/download/v0.1.0/pfs3-0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "f55f2286989c3e895ee5ba027576f4faa77ce2d6dc99e91ed7aa8114c00ac490"
    end
  end

  def install
    bin.install "pfs3"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/pfs3 --version")
  end
end
