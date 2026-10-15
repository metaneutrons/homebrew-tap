class MorphosCross < Formula
  desc "GCC 15 cross-compiler toolchain for MorphOS (PowerPC)"
  homepage "https://github.com/metaneutrons/morphos-cross"
  version "20260529-r4"
  license "GPL-3.0-or-later"

  depends_on "libarchive"
  depends_on "xz"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/metaneutrons/morphos-cross/releases/download/v20260529-r4/morphos-cross-20260529-r4-macos-arm64.tar.xz"
      sha256 "be6cf32a444621ded4d38b17696507f4d4e62f706ff0213028fadb8e1817434d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/metaneutrons/morphos-cross/releases/download/v20260529-r4/morphos-cross-20260529-r4-linux-arm64.tar.xz"
      sha256 "c992707004fc2c854f4a6b13a3975640899821bae35ca3bf5b837b2931bb06ca"
    end

    on_intel do
      url "https://github.com/metaneutrons/morphos-cross/releases/download/v20260529-r4/morphos-cross-20260529-r4-linux-x86_64.tar.xz"
      sha256 "f35e54072b7c36b00e3901669cfc4ac3fa3df805c3117e0d5f3f22f3379caab6"
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
    # On macOS the test environment names the host SDK in CPATH and SDKROOT. GCC searches CPATH before its
    # own include directories, so a cross compiler would read the macOS headers instead of the MorphOS ones.
    %w[CPATH C_INCLUDE_PATH CPLUS_INCLUDE_PATH LIBRARY_PATH SDKROOT].each { |name| ENV.delete(name) }
    system bin/"ppc-morphos-gcc", "-O2", "-o", "hello", "hello.c"
    assert_match "PowerPC", shell_output("#{bin}/ppc-morphos-readelf -h hello")
    assert_match "is installed", shell_output("#{bin}/morphos-cross-sdk status")
  end
end
