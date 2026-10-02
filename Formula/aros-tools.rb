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
      url "https://github.com/metaneutrons/aros-tools/releases/download/v0.3.18/aros-tools-v0.3.18-aarch64-apple-darwin.tar.gz"
      sha256 "9b34f9f64e6cd79182dfd0bd1e4681508bed3f7927b2bb0bf334824b49ce7440"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/metaneutrons/aros-tools/releases/download/v0.3.18/aros-tools-v0.3.18-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "bd5e1cf3a7659c839dbb455b7af4b91e6cb856ddf745837d14a906cb347799dc"
    else
      url "https://github.com/metaneutrons/aros-tools/releases/download/v0.3.18/aros-tools-v0.3.18-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "45988f08f4e0a446500aee316954522ab1886ce61a13d0a0c9b69bc6a9f84119"
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
