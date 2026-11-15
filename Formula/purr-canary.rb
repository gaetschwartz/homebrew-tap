class PurrCanary < Formula
  desc "Transcribe audio files and URLs on this computer"
  homepage "https://github.com/gaetschwartz/purr"
  version "0.1.0-canary.355"
  license "MIT"

  on_macos do
    depends_on arch: :arm64

    url "https://github.com/gaetschwartz/purr/releases/download/canary-0.1.0-canary.355/purr-cli-macos-arm64-metal.tar.gz"
    sha256 "2c5e0b79ff6a4c7264e314b63f7e505d651f2251be99f14cf37ec2ac776bf4e1"
  end

  on_linux do
    depends_on arch: :x86_64

    url "https://github.com/gaetschwartz/purr/releases/download/canary-0.1.0-canary.355/purr-cli-linux-x64-all.tar.gz"
    sha256 "4d5ae13b78728f831fbb4835f53a95e4c57c000ce8a8a61605ca45c8b148e6e3"
  end

  livecheck do
    skip "Rolling canary, republished by CI on every build"
  end

  conflicts_with "purr", because: "both install a `purr` binary"

  def install
    if OS.linux?
      libexec.install Dir["*"]
      bin.install_symlink libexec/"purr"
    else
      bin.install "purr"
    end
  end

  test do
    system bin/"purr", "--version"
  end
end
