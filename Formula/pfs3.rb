class Pfs3 < Formula
  desc "PFS3 (Amiga Professional File System III) tools"
  homepage "https://github.com/metaneutrons/pfs3"
  version "0.1.1"
  license "LGPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/pfs3/releases/download/v0.1.1/pfs3-0.1.1-x86_64-apple-darwin.tar.gz"
      sha256 "7e90e92ea9b10440bb9a3eaca70ec5c45f409df89069cb2c2c47d4699bc81fb8"
    else
      url "https://github.com/metaneutrons/pfs3/releases/download/v0.1.1/pfs3-0.1.1-aarch64-apple-darwin.tar.gz"
      sha256 "cdfe0a67776e6ca138b523a43f9ed7498a58f255db51ed0bd1e68f311ee5b406"
    end
  end

  def install
    bin.install "pfs3"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/pfs3 --version")
  end
end
