class SnapdogClient < Formula
  desc "SnapDog multiroom audio client"
  homepage "https://github.com/metaneutrons/snapdog"
  version "0.14.1"
  license "GPL-3.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/snapdog/releases/download/v0.14.1/snapdog-v0.14.1-x86_64-apple-darwin.tar.gz"
      sha256 "d2c64375683b8fc4962093e7446156fdec382b5b222766e55291bbeb00363c7e"
    else
      url "https://github.com/metaneutrons/snapdog/releases/download/v0.14.1/snapdog-v0.14.1-aarch64-apple-darwin.tar.gz"
      sha256 "659efb14d19b4856d452ae2185ad6508367bc2724810742b9a30cf191124d2e6"
    end
  end

  def install
    bin.install "snapdog-client"
  end
end
