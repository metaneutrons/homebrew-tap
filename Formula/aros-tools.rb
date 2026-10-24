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
      url "https://github.com/metaneutrons/aros-tools/releases/download/v0.6.2/aros-tools-v0.6.2-aarch64-apple-darwin.tar.gz"
      sha256 "3305533d48b9fcea420eed8b4c27cc29d0002ab36e1aeda781048ae6f2c7c3e1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/metaneutrons/aros-tools/releases/download/v0.6.2/aros-tools-v0.6.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "207183927dc54dc15f596b02f19b59521f7cd355f2e396025eb41e192b7ba284"
    else
      url "https://github.com/metaneutrons/aros-tools/releases/download/v0.6.2/aros-tools-v0.6.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "92c5a69fd30ad0dadf73e709141ea29061b6c693860872c7282854f6686d9745"
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
