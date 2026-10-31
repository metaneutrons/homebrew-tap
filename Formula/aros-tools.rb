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
      url "https://github.com/metaneutrons/aros-tools/releases/download/v0.6.10/aros-tools-v0.6.10-aarch64-apple-darwin.tar.gz"
      sha256 "ff806ce409a8c10b1bc473745d78314fa4921e6b58276df0259ebce6ce5e47db"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/metaneutrons/aros-tools/releases/download/v0.6.10/aros-tools-v0.6.10-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8f73ff7dff4c76e05bb3aad7f8c135fe9855a1524f3ca66c19cf2228ef2ad6f4"
    else
      url "https://github.com/metaneutrons/aros-tools/releases/download/v0.6.10/aros-tools-v0.6.10-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "dcb1ebc46e61c6f2c98fb4cf3c9732ed6bdd0fa16182ecd60d48b96712404346"
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
