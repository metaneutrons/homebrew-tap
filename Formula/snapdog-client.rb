class SnapdogClient < Formula
  desc "SnapDog multiroom audio client"
  homepage "https://github.com/metaneutrons/snapdog"
  version "0.12.1"
  license "GPL-3.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/snapdog/releases/download/v0.12.1/snapdog-v0.12.1-x86_64-apple-darwin.tar.gz"
      sha256 "cef5b8d8cf0fe5abd25a16e54ca135ff6ab1efbc819febbdbbcb4ed38d00ceb1"
    else
      url "https://github.com/metaneutrons/snapdog/releases/download/v0.12.1/snapdog-v0.12.1-aarch64-apple-darwin.tar.gz"
      sha256 "ae6684f4e8356b184b400fb7ca4642dfae0e296e042f187a653826fbf0306974"
    end
  end

  def install
    bin.install "snapdog-client"
  end
end
