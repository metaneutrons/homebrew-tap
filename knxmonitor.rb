class Knxmonitor < Formula
  desc "Professional KNX/EIB bus monitoring and debugging tool"
  homepage "https://github.com/metaneutrons/KnxMonitor"
  version "1.0.0"
  license "GPL-3.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/KnxMonitor/releases/download/v#{version}/KnxMonitor-#{version}-osx-x64.tar.gz"
      sha256 "" # Will be updated when release is available
    end
    if Hardware::CPU.arm?
      url "https://github.com/metaneutrons/KnxMonitor/releases/download/v#{version}/KnxMonitor-#{version}-osx-arm64.tar.gz"
      sha256 "" # Will be updated when release is available
    end
  end

  def install
    bin.install "KnxMonitor" => "knxmonitor"
  end

  test do
    # Test that the binary exists and shows version
    assert_match version.to_s, shell_output("#{bin}/knxmonitor --version")
    
    # Test that help command works
    assert_match "KNX Monitor", shell_output("#{bin}/knxmonitor --help")
    
    # Test that it shows available connection types
    help_output = shell_output("#{bin}/knxmonitor --help")
    assert_match "connection-type", help_output
    assert_match "tunneling", help_output
    assert_match "routing", help_output
  end
end