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
      url "https://github.com/metaneutrons/aros-tools/releases/download/v0.6.0/aros-tools-v0.6.0-aarch64-apple-darwin.tar.gz"
      sha256 "fc19d86a609185fba3d7356e21bb50381252fb2ce8cd5c7fcd5fcda16d335be0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/metaneutrons/aros-tools/releases/download/v0.6.0/aros-tools-v0.6.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f109c07311530e253c33b9e7accbb2fee2d85d4740d644eea2954ea4ec4fb07b"
    else
      url "https://github.com/metaneutrons/aros-tools/releases/download/v0.6.0/aros-tools-v0.6.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "19b28af05609eb2d633270c8a96de9cb9cdd862955216d20ecef13d2810b27a2"
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
