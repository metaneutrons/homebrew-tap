class ArosTools < Formula
  desc "Reproducible host-side build and development tools for AROS"
  homepage "https://github.com/metaneutrons/aros-tools"
  license "GPL-3.0-or-later"

  depends_on "cmake"
  depends_on "curl"
  depends_on "git"
  depends_on "ninja"
  depends_on "python@3.14"

  on_macos do
    on_arm do
      url "https://github.com/metaneutrons/aros-tools/releases/download/v0.3.17/aros-tools-v0.3.17-aarch64-apple-darwin.tar.gz"
      sha256 "1991a002239fbeb8be7258b225394842832e98de35f82e887e7eb8ab6ae01236"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/metaneutrons/aros-tools/releases/download/v0.3.17/aros-tools-v0.3.17-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c532a1fe09bb4448032ac8fae8b636f949611b4b35fbca4462fd4a3b2807b702"
    else
      url "https://github.com/metaneutrons/aros-tools/releases/download/v0.3.17/aros-tools-v0.3.17-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b949cbd3bb00104958f012f89a383145d4d8dd2f7e4e947694c00c2ce2473cf6"
    end
  end

  def install
    bin.install Dir["bin/*"]
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aros --version")
    system "#{bin}/aros-collect", "--help"
  end
end
