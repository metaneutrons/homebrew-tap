require "json"

class AmiRust < Formula
  desc "Native PC x86-64 AROS ABI-v1 SDK"
  homepage "https://github.com/metaneutrons/ami-rust"
  url "https://github.com/metaneutrons/ami-rust/releases/download/v0.1.0%2Bpackaging.2/ami-rust-0.1.0-packaging.2.tar.xz"
  version "0.1.0"
  sha256 "6567abfb4e36a2bf82816f51512343f4d1232c97c866e648fdf68ab4cf7f2448"

  # This composite contains an adapter under MIT OR Apache-2.0 and upstream
  # SDK components with their own terms, including custom AROS and libgit
  # licenses. The included original publisher SPDX document preserves those
  # per-component details; the declaration below describes the composite.
  license :cannot_represent
  revision 2

  livecheck do
    skip "This packaging release requires explicit qualification."
  end

  depends_on arch: :arm64
  depends_on "git"
  depends_on macos: :tahoe
  depends_on "python@3.14"

  def install
    prefix.install Dir["usr/*"]
    python = formula_opt_bin("python@3.14")/"python3.14"
    inreplace bin/"ami-rust", "#!/usr/bin/python3", "#!#{python}"
  end

  def caveats
    <<~EOS
      Prepare the SDK explicitly with `ami-rust prepare --state PATH`.
      Preparation requires at least 6 GiB of RAM and 24 GiB of free disk.
      Installation leaves global compiler defaults unchanged.
    EOS
  end

  test do
    assert_equal(
      "ami-rust 0.1.0 (packaging 2)",
      shell_output("#{bin}/ami-rust --version").strip,
    )
    assert_equal(
      {
        "status"          => "VERIFIED_PACKAGE",
        "sdk_version"     => "0.1.0",
        "package_version" => "0.1.0-2",
      },
      JSON.parse(shell_output("#{bin}/ami-rust verify-package")),
    )
  end
end
