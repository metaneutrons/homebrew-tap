class Knxmonitor < Formula
  desc "KNX/EIB bus monitoring and debugging tool"
  homepage "https://github.com/metaneutrons/KnxMonitor"
  version "0.10.10"
  license "GPL-3.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/KnxMonitor/releases/download/v0.10.10/KnxMonitor-0.10.10-osx-x64.tar.gz"
      sha256 "c0c75e910527c018018920a8772d1a586dd6780b221baeb1e380b2be377a22a5"
    else
      url "https://github.com/metaneutrons/KnxMonitor/releases/download/v0.10.10/KnxMonitor-0.10.10-osx-arm64.tar.gz"
      sha256 "423613f46dcdb8c90717723240e42d144f938a0d398885c3e18f77eddc8bd9f1"
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
