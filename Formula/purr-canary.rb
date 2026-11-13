class PurrCanary < Formula
  desc "Transcribe audio files and URLs with Whisper"
  homepage "https://github.com/gaetschwartz/purr"
  version "0.1.0-canary.345"
  license "MIT"

  on_macos do
    depends_on arch: :arm64

    url "https://github.com/gaetschwartz/purr/releases/download/canary-0.1.0-canary.345/purr-cli-macos-arm64-metal.tar.gz"
    sha256 "fe447deae79bbcda950199392d452ebd0cb03bf1a02d2dca749a986992074594"
  end

  on_linux do
    depends_on arch: :x86_64

    url "https://github.com/gaetschwartz/purr/releases/download/canary-0.1.0-canary.345/purr-cli-linux-x64-all.tar.gz"
    sha256 "f84b769ee8aa7b9422db3d351a65c4f5886912e43122dba36b1512430a7ec7c3"
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
