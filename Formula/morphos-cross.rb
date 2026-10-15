class MorphosCross < Formula
  desc "GCC 15 cross-compiler toolchain for MorphOS (PowerPC)"
  homepage "https://github.com/metaneutrons/morphos-cross"
  version "20260529-r3"
  license "GPL-3.0-or-later"

  depends_on "libarchive"
  depends_on "xz"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/metaneutrons/morphos-cross/releases/download/v20260529-r3/morphos-cross-20260529-r3-macos-arm64.tar.xz"
      sha256 "576fa2abce0327df5dd7e04cbfec2191c8a418c6c774b3ef4a0b1cb7c10772c7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/metaneutrons/morphos-cross/releases/download/v20260529-r3/morphos-cross-20260529-r3-linux-arm64.tar.xz"
      sha256 "1a5c5d0038cfe96da62a62728867b1e38aa0b7a830dc0c64141989600768d10e"
    end

    on_intel do
      url "https://github.com/metaneutrons/morphos-cross/releases/download/v20260529-r3/morphos-cross-20260529-r3-linux-x86_64.tar.xz"
      sha256 "bfcd7145d1f7cd7b8aee8e1a14bc0cc33dec8d84a06f2294480b9c71d4912998"
    end
  end

  # The MorphOS SDK belongs to the MorphOS Team. brew fetches it from their site for the user and checks
  # the checksum; this tap never carries a copy.
  resource "sdk" do
    url "https://morphos-team.net/files/sdk-20260529.lha", using: :nounzip
    sha256 "310dfb888b995e32206c5c3aba409847334a5fee049d13aad27b4af0d518ec77"
  end

  def install
    libexec.install Dir["*"]
    bin.install_symlink Dir[libexec/"bin/*"]
    # The helper reads the SDK archive with bsdtar, which libarchive provides without linking it.
    with_env(PATH: "#{formula_opt_bin("libarchive")}:#{ENV["PATH"]}") do
      system libexec/"bin/morphos-cross-sdk", "install", resource("sdk").cached_download
    end
  end

  def caveats
    <<~EOS
      The MorphOS SDK (sdk-20260529.lha) was installed into the toolchain from the MorphOS Team's site.
      If a newer release of this formula pins a newer SDK, "brew upgrade" installs that one as well.
    EOS
  end

  test do
    (testpath/"hello.c").write <<~C
      #include <stdio.h>
      int main(void) { puts("hello"); return 0; }
    C
    system bin/"ppc-morphos-gcc", "-O2", "-o", "hello", "hello.c"
    assert_match "PowerPC", shell_output("#{bin}/ppc-morphos-readelf -h hello")
    assert_match "is installed", shell_output("#{bin}/morphos-cross-sdk status")
  end
end
