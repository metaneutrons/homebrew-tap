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
      url "https://github.com/metaneutrons/aros-tools/releases/download/v0.6.8/aros-tools-v0.6.8-aarch64-apple-darwin.tar.gz"
      sha256 "219d0dac276f1e6b9df24768f8275347c26114410aa74c347875c99981372904"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/metaneutrons/aros-tools/releases/download/v0.6.8/aros-tools-v0.6.8-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "bcea3a5151fa026a13d7d2feff9f763f80a9756efa8bcd505c358728336cb61e"
    else
      url "https://github.com/metaneutrons/aros-tools/releases/download/v0.6.8/aros-tools-v0.6.8-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8d9ca9327e105933de7749cccd7bbeadb648670558b84c842c4289a05256772e"
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
