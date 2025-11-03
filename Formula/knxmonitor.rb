class Knxmonitor < Formula
  desc "KNX/EIB bus monitoring and debugging tool"
  homepage "https://github.com/metaneutrons/KnxMonitor"
  version "0.10.12"
  license "GPL-3.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/KnxMonitor/releases/download/v0.10.12/KnxMonitor-0.10.12-osx-x64.tar.gz"
      sha256 "374e23cb3cfb35332b1f8b69febcfe6b38cf0bbfacc0d6d428bff8942d0b4195"
    else
      url "https://github.com/metaneutrons/KnxMonitor/releases/download/v0.10.12/KnxMonitor-0.10.12-osx-arm64.tar.gz"
      sha256 "27082d1649e990a14e727801a01acabce062de1cfb3d5d2755b5fc4b9d44b71f"
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
