class PurrCanary < Formula
  desc "Transcribe audio files and URLs with Whisper"
  homepage "https://github.com/gaetschwartz/purr"
  version "0.1.0-canary.353"
  license "MIT"

  on_macos do
    depends_on arch: :arm64

    url "https://github.com/gaetschwartz/purr/releases/download/canary-0.1.0-canary.353/purr-cli-macos-arm64-metal.tar.gz"
    sha256 "03f5443f30961b78e1807d4fa955e53aef8b697fe60952f58fcb39b4b3dbb3d6"
  end

  on_linux do
    depends_on arch: :x86_64

    url "https://github.com/gaetschwartz/purr/releases/download/canary-0.1.0-canary.353/purr-cli-linux-x64-all.tar.gz"
    sha256 "7e445ff8164438e47c06a05af283bfe653001c54d40bb0b95e9c562936a9496b"
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
