class Bups < Formula
  desc "USB print server for Brother PT and QL label printers"
  homepage "https://github.com/metaneutrons/bups"
  license "GPL-3.0-or-later"

  on_macos do
    on_intel do
      url "https://github.com/metaneutrons/bups/releases/download/v0.3.3/bups-0.3.3-x86_64-apple-darwin.tar.gz"
      sha256 "c1cc9dbe0f6af1a61158eff6c777fd9c3db757cb681ba67c89824caa1d4199aa"
    end
    on_arm do
      url "https://github.com/metaneutrons/bups/releases/download/v0.3.3/bups-0.3.3-aarch64-apple-darwin.tar.gz"
      sha256 "ef416a00c805cf46e1c78137f531cabcca0ee6ed38a691413f3058f433564709"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/metaneutrons/bups/releases/download/v0.3.3/bups-0.3.3-x86_64-unknown-linux-musl.tar.gz"
      sha256 "cf7a17327039ca8058ced67aab56e013148a6637b65eb8021482edd4a3eb185e"
    end
    on_arm do
      url "https://github.com/metaneutrons/bups/releases/download/v0.3.3/bups-0.3.3-aarch64-unknown-linux-musl.tar.gz"
      sha256 "e9d8bfbb34b1b0090e9a073876369a92fa7de178b6f31b935feb63fb7d271250"
    end
  end

  def install
    bin.install "bups"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bups --version")
  end
end
