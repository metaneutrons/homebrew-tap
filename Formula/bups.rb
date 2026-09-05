class Bups < Formula
  desc "USB print server for Brother PT and QL label printers"
  homepage "https://github.com/metaneutrons/bups"
  license "GPL-3.0-or-later"

  on_macos do
    on_intel do
      url "https://github.com/metaneutrons/bups/releases/download/v0.3.4/bups-0.3.4-x86_64-apple-darwin.tar.gz"
      sha256 "99501d96c1a5a8a0728f43753cee295921ac54278a56026e6ec58d671aafd35f"
    end
    on_arm do
      url "https://github.com/metaneutrons/bups/releases/download/v0.3.4/bups-0.3.4-aarch64-apple-darwin.tar.gz"
      sha256 "b29a6ef156f9bf587e945ee1f9531d2aed48a4a01ca2ed77edc7bed1d93d991f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/metaneutrons/bups/releases/download/v0.3.4/bups-0.3.4-x86_64-unknown-linux-musl.tar.gz"
      sha256 "db1e5bbb9f86d82bfd0ba8a0803eb07beec19742190d15431236e0ee508eb460"
    end
    on_arm do
      url "https://github.com/metaneutrons/bups/releases/download/v0.3.4/bups-0.3.4-aarch64-unknown-linux-musl.tar.gz"
      sha256 "cea18f792d7de62395c199f83b0a2c6e107a100a4910729f65ab015412865de4"
    end
  end

  def install
    bin.install "bups"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bups --version")
  end
end
