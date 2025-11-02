class Knxmonitor < Formula
  desc "KNX/EIB bus monitoring and debugging tool"
  homepage "https://github.com/metaneutrons/KnxMonitor"
  version "0.10.11"
  license "GPL-3.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/KnxMonitor/releases/download/v0.10.11/KnxMonitor-0.10.11-osx-x64.tar.gz"
      sha256 "ddf1d5ea56102d96bf0091621dacadbd97d4da7020c1c580dcf625a336e876b6"
    else
      url "https://github.com/metaneutrons/KnxMonitor/releases/download/v0.10.11/KnxMonitor-0.10.11-osx-arm64.tar.gz"
      sha256 "88ca009035d1167c6733acd2d086cf8dd80d8ba38d08bd714fe8e1430c4b9acc"
    end
  end

  def install
    bin.install "KnxMonitor" => "knxmonitor"
    man1.install "docs/knxmonitor.1" if File.exist?("docs/knxmonitor.1")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/knxmonitor --version")
  end
end
