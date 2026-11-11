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
      url "https://github.com/metaneutrons/aros-tools/releases/download/v0.6.15/aros-tools-v0.6.15-aarch64-apple-darwin.tar.gz"
      sha256 "b741f9fe22e07160ddba325f953f04d247fcc16e22b6824fae43d3cb29c3cf96"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/metaneutrons/aros-tools/releases/download/v0.6.15/aros-tools-v0.6.15-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "017e9a247f28e785fcc5044c5f6971038ecf2d6ff4a1a55ae3d9207115046eb8"
    else
      url "https://github.com/metaneutrons/aros-tools/releases/download/v0.6.15/aros-tools-v0.6.15-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "361a9115d24681c7352a78df08be20318edd48a85ff75f337210d5e26e5555e6"
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
