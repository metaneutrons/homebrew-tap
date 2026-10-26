class AmiRust < Formula
  desc "Rust cross-development toolchain for x86-64 AROS"
  homepage "https://github.com/metaneutrons/ami-rust"
  url "https://github.com/metaneutrons/ami-rust/releases/download/v0.2.0/ami-rust-toolchain-0.2.0-macos-aarch64.tar.xz"
  version "0.2.0"
  sha256 "eb5fa6077abae6f5aeeb5432c7a9d798744d67f7dc1049efafdf8bc7d7151419"
  license :cannot_represent
  revision 2

  depends_on arch: :arm64
  depends_on :macos

  preserve_rpath

  def install
    libexec.install "ami-rust"
    File.symlink(version.to_s, libexec/"ami-rust"/"current")
  end

  def caveats
    <<~EOS
      To opt in to the tracking rustup alias, run:
        rustup toolchain link aros "#{opt_prefix}/libexec/ami-rust/current"

      To opt in to a version-specific rustup alias, run:
        rustup toolchain link aros-#{version} "#{prefix}/libexec/ami-rust/#{version}"

      The version-specific alias targets this Cellar copy. Homebrew cleanup or
      formula removal deletes that copy. Copy the SDK to a user-owned path and
      link rustup there if you need it to outlive this installation.
    EOS
  end

  test do
    sdk = libexec/"ami-rust/#{version}"
    current = libexec/"ami-rust/current"
    assert_predicate current, :symlink?
    assert_equal version.to_s, File.readlink(current)
    assert_predicate sdk/"bin/rustc", :executable?
    assert_predicate sdk/"bin/cargo", :executable?
    assert_match(/\Arustc \S+/, shell_output("#{sdk}/bin/rustc -V"))
    assert_match(/\Acargo \S+/, shell_output("#{sdk}/bin/cargo -V"))
  end
end
