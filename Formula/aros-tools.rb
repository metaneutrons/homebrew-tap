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
      url "https://github.com/metaneutrons/aros-tools/releases/download/v0.6.7/aros-tools-v0.6.7-aarch64-apple-darwin.tar.gz"
      sha256 "5e2c1719f18676e3748ecf0e0d2a952d779c851890e7f382e82b705ec4a9e15f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/metaneutrons/aros-tools/releases/download/v0.6.7/aros-tools-v0.6.7-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f790db781a71cbeb121705fafa33cbc884a5d453be19aec975bf70942585b93c"
    else
      url "https://github.com/metaneutrons/aros-tools/releases/download/v0.6.7/aros-tools-v0.6.7-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "80fd10728a942bf81a733758b318876aa3c8e842e0fd84ed9371d061df11478a"
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
