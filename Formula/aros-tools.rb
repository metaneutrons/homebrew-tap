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
      url "https://github.com/metaneutrons/aros-tools/releases/download/v0.3.9/aros-tools-v0.3.9-aarch64-apple-darwin.tar.gz"
      sha256 "ea639de0d3320e2adfb679e9cc7c74152144505718f6df0c8b2ae8fcd9149c4c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/metaneutrons/aros-tools/releases/download/v0.3.9/aros-tools-v0.3.9-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d3e1e7ed73febd5f88d7cd9bc3e19c0b18cf871a2c255dfb8a051a98363ee001"
    else
      url "https://github.com/metaneutrons/aros-tools/releases/download/v0.3.9/aros-tools-v0.3.9-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "eb700e423db98bbe762383fc7eaf5604c04657e0f14c25220f1943a4cbf406a8"
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
