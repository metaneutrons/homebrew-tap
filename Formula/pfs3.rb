class Pfs3 < Formula
  desc "PFS3 (Amiga Professional File System III) tools"
  homepage "https://github.com/metaneutrons/pfs3"
  version "0.1.3"
  license "LGPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/pfs3/releases/download/v0.1.3/pfs3-0.1.3-x86_64-apple-darwin.tar.gz"
      sha256 "8f3383322d3bd359a4c74bf15c0a6add5de9b3f54700f09f0e5f29d54cc73f88"
    else
      url "https://github.com/metaneutrons/pfs3/releases/download/v0.1.3/pfs3-0.1.3-aarch64-apple-darwin.tar.gz"
      sha256 "c2cb6d1a238d34449fb34b7bc0d35391f52225cea0a780ee86dbf6fc6e44c6c7"
    end
  end

  def install
    bin.install "pfs3"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/pfs3 --version")
  end
end
