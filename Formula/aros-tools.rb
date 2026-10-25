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
      url "https://github.com/metaneutrons/aros-tools/releases/download/v0.6.4/aros-tools-v0.6.4-aarch64-apple-darwin.tar.gz"
      sha256 "4b163f4db65cf55fbe9d381c22ddb865838e7d69c5adb7c26af5322404d6f945"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/metaneutrons/aros-tools/releases/download/v0.6.4/aros-tools-v0.6.4-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "cf203df04f80c1b19442fd65ff367361f4fb81c31fdb125d079f5971584ebf1b"
    else
      url "https://github.com/metaneutrons/aros-tools/releases/download/v0.6.4/aros-tools-v0.6.4-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9a2dd71077a70bfbda50b285bd4afa7bdae5636ff5a9c0590c3e5ae25911abde"
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
