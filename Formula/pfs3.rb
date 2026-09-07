class Pfs3 < Formula
  desc "PFS3 (Amiga Professional File System III) tools"
  homepage "https://github.com/metaneutrons/pfs3"
  license "LGPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/pfs3/releases/download/v0.1.5/pfs3-0.1.5-x86_64-apple-darwin.tar.gz"
      sha256 "ce3e749421d34324aba40997a4810e30a4f054126b15a40897bea79c100a462f"
    else
      url "https://github.com/metaneutrons/pfs3/releases/download/v0.1.5/pfs3-0.1.5-aarch64-apple-darwin.tar.gz"
      sha256 "8cfc218235d1f62b443678a653975681a108e9c1ce61988d9fc03cf837570bc9"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/pfs3/releases/download/v0.1.5/pfs3-0.1.5-x86_64-unknown-linux-musl.tar.gz"
      sha256 "73a595b55d0b449ef109818255e38e9c9d5bd64f82c65d1e366ea4b7fb20367c"
    else
      url "https://github.com/metaneutrons/pfs3/releases/download/v0.1.5/pfs3-0.1.5-aarch64-unknown-linux-musl.tar.gz"
      sha256 "40e3517c7f2e60e8b0d12aa2db7cb4adb5048e4c4b2b032573b20b912c898e49"
    end
  end

  def install
    bin.install "pfs3"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/pfs3 --version")
  end
end
