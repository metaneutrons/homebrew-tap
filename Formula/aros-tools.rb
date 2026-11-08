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
      url "https://github.com/metaneutrons/aros-tools/releases/download/v0.6.13/aros-tools-v0.6.13-aarch64-apple-darwin.tar.gz"
      sha256 "8c830163359ce5deb76e8508bfe39f31bd2683520710ed66a5b86d22394f4655"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/metaneutrons/aros-tools/releases/download/v0.6.13/aros-tools-v0.6.13-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8eda004ff230b6b3e04e0d0a50a821d452d48bf90ae142993ba0589d76347a53"
    else
      url "https://github.com/metaneutrons/aros-tools/releases/download/v0.6.13/aros-tools-v0.6.13-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "39a1e6d8639e7c158872084d5d6d9c52a50cbbd294ade1c1d6f5a47fb8bd589f"
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
