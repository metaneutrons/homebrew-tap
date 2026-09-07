class Pfs3 < Formula
  desc "PFS3 (Amiga Professional File System III) tools"
  homepage "https://github.com/metaneutrons/pfs3"
  license "LGPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/pfs3/releases/download/v0.1.6/pfs3-0.1.6-x86_64-apple-darwin.tar.gz"
      sha256 "b972168b3d0336946ef35162caac3d9d7e1ff1eb51c70196957afe7078f9db2c"
    else
      url "https://github.com/metaneutrons/pfs3/releases/download/v0.1.6/pfs3-0.1.6-aarch64-apple-darwin.tar.gz"
      sha256 "c63413e4c094fce8d81f67ff60f123bbd057eabf95984c2d1e98b5e0e558c46d"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/pfs3/releases/download/v0.1.6/pfs3-0.1.6-x86_64-unknown-linux-musl.tar.gz"
      sha256 "8064b81577603609f9d219270d2bcd918104b424c1a74400b9cbfe49331c4ed6"
    else
      url "https://github.com/metaneutrons/pfs3/releases/download/v0.1.6/pfs3-0.1.6-aarch64-unknown-linux-musl.tar.gz"
      sha256 "e309d2d15d4b7f1109f5da4610353c9a607677ac45406318176540579c16b2f5"
    end
  end

  def install
    bin.install "pfs3"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/pfs3 --version")
  end
end
