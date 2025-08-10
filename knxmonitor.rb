class Knxmonitor < Formula
  desc "Professional KNX/EIB bus monitoring and debugging tool"
  homepage "https://github.com/metaneutrons/KnxMonitor"
  version "0.9.8"
  license "GPL-3.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/KnxMonitor/releases/download/v#{version}/KnxMonitor-#{version}-osx-x64.tar.gz"
      sha256 "90206ae1e33a3c0f761a182531b4d14cfe22aefdfc2fe70408826faec963352d" # Will be updated when release is available
    end
    if Hardware::CPU.arm?
      url "https://github.com/metaneutrons/KnxMonitor/releases/download/v#{version}/KnxMonitor-#{version}-osx-arm64.tar.gz"
      sha256 "9dc2f04e8053a2fe1c68b6b1ae7e15627684ee28a0639dd00362e7131c975665" # Will be updated when release is available
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