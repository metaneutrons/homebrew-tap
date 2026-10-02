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
      url "https://github.com/metaneutrons/aros-tools/releases/download/v0.3.19/aros-tools-v0.3.19-aarch64-apple-darwin.tar.gz"
      sha256 "8eb7c8e1ea40dae35943295c01b208a07b4264cf6c41e9b498f3fb0493e44625"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/metaneutrons/aros-tools/releases/download/v0.3.19/aros-tools-v0.3.19-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d3cdfb860c4bb381a2bb1540959f9d895ab2101cdda64dd21450c8878c72bef3"
    else
      url "https://github.com/metaneutrons/aros-tools/releases/download/v0.3.19/aros-tools-v0.3.19-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "96b0219d6cf29460fee07fd415978f52bc91d2d8ac3f484195cb63f7e11d984a"
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
