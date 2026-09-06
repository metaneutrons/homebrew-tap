class Bups < Formula
  desc "USB print server for Brother PT and QL label printers"
  homepage "https://github.com/metaneutrons/bups"
  license "GPL-3.0-or-later"

  on_macos do
    on_intel do
      url "https://github.com/metaneutrons/bups/releases/download/v0.3.5/bups-0.3.5-x86_64-apple-darwin.tar.gz"
      sha256 "4f4c3612248cf66ae87a45f29dd43e8c326c30f90e99e4271e5e7207050b39f0"
    end
    on_arm do
      url "https://github.com/metaneutrons/bups/releases/download/v0.3.5/bups-0.3.5-aarch64-apple-darwin.tar.gz"
      sha256 "62101026d6bbdf0e97573661ca9d9431f12f43cca3b8772573c8fc15b1fdfb3f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/metaneutrons/bups/releases/download/v0.3.5/bups-0.3.5-x86_64-unknown-linux-musl.tar.gz"
      sha256 "460a5cc752220a1f4a012a429c7e4690fe13352a6021b7934cec97a5871ae2eb"
    end
    on_arm do
      url "https://github.com/metaneutrons/bups/releases/download/v0.3.5/bups-0.3.5-aarch64-unknown-linux-musl.tar.gz"
      sha256 "f58a9c0f28c78f173043e25a175a1b32468134d33ee2618b567021de3a9140d5"
    end
  end

  def install
    bin.install "bups"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bups --version")
  end
end
