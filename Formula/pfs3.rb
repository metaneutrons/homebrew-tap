class Pfs3 < Formula
  desc "PFS3 (Amiga Professional File System III) tools"
  homepage "https://github.com/metaneutrons/pfs3"
  license "LGPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/pfs3/releases/download/v0.1.4/pfs3-0.1.4-x86_64-apple-darwin.tar.gz"
      sha256 "703d6f7cd9e8cbf2751028bca14477d5317670aa74af036c4e23b860476938d9"
    else
      url "https://github.com/metaneutrons/pfs3/releases/download/v0.1.4/pfs3-0.1.4-aarch64-apple-darwin.tar.gz"
      sha256 "f87486ad095947aefd90dba7c92b3db39f1146d36c69aaf60f11066bf3d69f04"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/pfs3/releases/download/v0.1.4/pfs3-0.1.4-x86_64-unknown-linux-musl.tar.gz"
      sha256 "c33505f340dc123fec227693d677a9ebc2044f46e1d3c1a1df8f6b9272726669"
    else
      url "https://github.com/metaneutrons/pfs3/releases/download/v0.1.4/pfs3-0.1.4-aarch64-unknown-linux-musl.tar.gz"
      sha256 "49dd71601d896012115f7196ca9494d8cb6b0f7909d7fb27ea281d0512971878"
    end
  end

  def install
    bin.install "pfs3"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/pfs3 --version")
  end
end
