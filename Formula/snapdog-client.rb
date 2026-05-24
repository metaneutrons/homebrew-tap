class SnapdogClient < Formula
  desc "SnapDog multiroom audio client"
  homepage "https://github.com/metaneutrons/snapdog"
  version "0.14.2"
  license "GPL-3.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/snapdog/releases/download/v0.14.2/snapdog-v0.14.2-x86_64-apple-darwin.tar.gz"
      sha256 "f2be77a14115c834262015da0aebcaba535f99fe8b06ea8ab9febf6621396e10"
    else
      url "https://github.com/metaneutrons/snapdog/releases/download/v0.14.2/snapdog-v0.14.2-aarch64-apple-darwin.tar.gz"
      sha256 "6f9d738cbd88824c8fb1d194f55c9ae26aa312f67f932878f525f17a0878bbc6"
    end
  end

  def install
    bin.install "snapdog-client"
  end
end
