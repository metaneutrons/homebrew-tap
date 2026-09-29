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
      url "https://github.com/metaneutrons/aros-tools/releases/download/v0.3.16/aros-tools-v0.3.16-aarch64-apple-darwin.tar.gz"
      sha256 "62030915022eef9391638ec8218ad854be3e5204619d6d7629ea72f22ebd85cb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/metaneutrons/aros-tools/releases/download/v0.3.16/aros-tools-v0.3.16-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "bf9dcf3aaefe2eb01ca06fc94100137064ead4b9eeb54e2efe90ebe96f7db3ce"
    else
      url "https://github.com/metaneutrons/aros-tools/releases/download/v0.3.16/aros-tools-v0.3.16-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "29dcb55fe0136a6853e3c6c6f7cd16e09609bba7c4a08da2b297ec3f4a7f7682"
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
