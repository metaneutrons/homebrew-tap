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
      url "https://github.com/metaneutrons/aros-tools/releases/download/v0.6.17/aros-tools-v0.6.17-aarch64-apple-darwin.tar.gz"
      sha256 "53b27b700b05f437ab43a7d120d8037add70c76907c6914d6a68d3c466e17594"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/metaneutrons/aros-tools/releases/download/v0.6.17/aros-tools-v0.6.17-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b8168c3e07e6d14a1d54c46db948f0b2ca6890c58882514c03c74f0f1f717838"
    else
      url "https://github.com/metaneutrons/aros-tools/releases/download/v0.6.17/aros-tools-v0.6.17-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "edc2709c81c8e7e5027edd49de26449a84bd37be078eab32bc9172666bf84086"
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
