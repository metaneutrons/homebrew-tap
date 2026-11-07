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
      url "https://github.com/metaneutrons/aros-tools/releases/download/v0.6.12/aros-tools-v0.6.12-aarch64-apple-darwin.tar.gz"
      sha256 "f7af4244b100523a570ccf95dd936d0551d216d77c3f66c826a02342a675f6c5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/metaneutrons/aros-tools/releases/download/v0.6.12/aros-tools-v0.6.12-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "68a9479856e09bc37e3b9782e66abd7200ffbf0d3d314075cf405bf8a4b13c67"
    else
      url "https://github.com/metaneutrons/aros-tools/releases/download/v0.6.12/aros-tools-v0.6.12-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fe401f034d866db62128c6da871569971890d32ffe724244dfae3f0a530468c7"
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
