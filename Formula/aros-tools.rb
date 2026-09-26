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
      url "https://github.com/metaneutrons/aros-tools/releases/download/v0.3.12/aros-tools-v0.3.12-aarch64-apple-darwin.tar.gz"
      sha256 "ef754c43184aa11848fbb5a8e588ddef1b4c512fad692b046f9903c5327c6fe6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/metaneutrons/aros-tools/releases/download/v0.3.12/aros-tools-v0.3.12-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "703f0d2f68e3b9b71592b807701ef3d744467bf999a022e6419560cb8097ae7e"
    else
      url "https://github.com/metaneutrons/aros-tools/releases/download/v0.3.12/aros-tools-v0.3.12-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a05696e42e1fc3d6639c0399f058ecff78276a03c13126aa62e69a7d3d53f4c6"
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
