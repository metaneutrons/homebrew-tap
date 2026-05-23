class SnapdogClient < Formula
  desc "SnapDog multiroom audio client"
  homepage "https://github.com/metaneutrons/snapdog"
  version "0.12.3"
  license "GPL-3.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/snapdog/releases/download/v0.12.3/snapdog-v0.12.3-x86_64-apple-darwin.tar.gz"
      sha256 "33d938f61ba8e2b6275d201b015de56177e713ffd096c2e35124a233b5428ec6"
    else
      url "https://github.com/metaneutrons/snapdog/releases/download/v0.12.3/snapdog-v0.12.3-aarch64-apple-darwin.tar.gz"
      sha256 "b1021a21cecdc1ed19f529b89a758cdabff8374409ba5a2721599da2a40e9e7a"
    end
  end

  def install
    bin.install "snapdog-client"
  end
end
