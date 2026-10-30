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
      url "https://github.com/metaneutrons/aros-tools/releases/download/v0.6.9/aros-tools-v0.6.9-aarch64-apple-darwin.tar.gz"
      sha256 "e3331e4f74db010ecc8e7edc91d775858056d500edcd3225fc71918e272ead0c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/metaneutrons/aros-tools/releases/download/v0.6.9/aros-tools-v0.6.9-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c414f99dcbf5d07af4d8f222b9c50c0598c988a68ecc610281c7a7009345b349"
    else
      url "https://github.com/metaneutrons/aros-tools/releases/download/v0.6.9/aros-tools-v0.6.9-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a2339ce4ba14938c7537a53e9f6efbf21282d51464de96d76202d026f5cb8dfd"
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
