class PurrCanary < Formula
  desc "Transcribe audio files and URLs with Whisper"
  homepage "https://github.com/gaetschwartz/purr"
  version "0.1.0-canary.343"
  license "MIT"

  on_macos do
    depends_on arch: :arm64

    url "https://github.com/gaetschwartz/purr/releases/download/canary-0.1.0-canary.343/purr-cli-macos-arm64-metal.tar.gz"
    sha256 "b8b5f2a8b49555e280765baf9b753ea21fa5632a1c857128346b2a83de7c4391"
  end

  on_linux do
    depends_on arch: :x86_64

    url "https://github.com/gaetschwartz/purr/releases/download/canary-0.1.0-canary.343/purr-cli-linux-x64-all.tar.gz"
    sha256 "a5b96070014742243c64a0a6aa09ffa47f81fbba26fde2f0a666513a1a2bf95f"
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
