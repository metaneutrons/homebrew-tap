class Bups < Formula
  desc "USB print server for Brother PT and QL label printers"
  homepage "https://github.com/metaneutrons/bups"
  version "0.3.2"
  license "GPL-3.0-or-later"

  on_macos do
    on_intel do
      url "https://github.com/metaneutrons/bups/releases/download/v0.3.2/bups-0.3.2-x86_64-apple-darwin.tar.gz"
      sha256 "2c58ad8fd802e850490784ada182b5b206649fed6e36d6894facb7cb9b6f9ba1"
    end
    on_arm do
      url "https://github.com/metaneutrons/bups/releases/download/v0.3.2/bups-0.3.2-aarch64-apple-darwin.tar.gz"
      sha256 "e4730a276d09f8c30a79938825da973e1f5ecd2b5d0413341423489bcf59dc31"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/metaneutrons/bups/releases/download/v0.3.2/bups-0.3.2-x86_64-unknown-linux-musl.tar.gz"
      sha256 "32f1b7d0f2b0bdbbb9949b081d1efd4363acd795c3395b3b2e7048cb0978d9e3"
    end
    on_arm do
      url "https://github.com/metaneutrons/bups/releases/download/v0.3.2/bups-0.3.2-aarch64-unknown-linux-musl.tar.gz"
      sha256 "6b9685d79db2126553f7a960e5fc4dd38b66c9d31b52aa90a7db4d0a5af7d49d"
    end
  end

  def install
    bin.install "bups"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bups --version")
  end
end
