class AmiRust < Formula
  desc "Rust cross-development toolchain for x86-64 AROS"
  homepage "https://github.com/metaneutrons/ami-rust"
  url "https://github.com/metaneutrons/ami-rust/releases/download/v0.3.2/ami-rust-0.3.2-macos-aarch64.tar.xz"
  version "0.3.2"
  sha256 "2656dc2f722264ad932bfe484788e19d83bb5ff9aae96cc53d415c7bc799079b"
  license :cannot_represent

  depends_on arch: :arm64
  depends_on :macos

  preserve_rpath

  def install
    # The Direct archive already carries libexec/ami-rust/<version>.
    libexec.install "libexec/ami-rust"
    File.symlink version.to_s, libexec/"ami-rust"/"current"
  end

  def caveats
    <<~EOS
      To opt in to the tracking rustup alias, run:
        rustup toolchain link aros "#{opt_prefix}/libexec/ami-rust/current"

      To opt in to this version specifically, run:
        rustup toolchain link aros-#{version} "#{prefix}/libexec/ami-rust/#{version}"
    EOS
  end

  test do
    sdk = libexec/"ami-rust/#{version}"
    assert_predicate sdk/"bin/rustc", :executable?
    assert_predicate sdk/"bin/cargo", :executable?
  end
end
