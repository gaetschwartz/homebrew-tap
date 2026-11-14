class PurrCanary < Formula
  desc "Transcribe audio files and URLs with Whisper"
  homepage "https://github.com/gaetschwartz/purr"
  version "0.1.0-canary.352"
  license "MIT"

  on_macos do
    depends_on arch: :arm64

    url "https://github.com/gaetschwartz/purr/releases/download/canary-0.1.0-canary.352/purr-cli-macos-arm64-metal.tar.gz"
    sha256 "5611dfd19de796e74b115fc0735050366161d77966e0b7e7cf1e86f10de7b088"
  end

  on_linux do
    depends_on arch: :x86_64

    url "https://github.com/gaetschwartz/purr/releases/download/canary-0.1.0-canary.352/purr-cli-linux-x64-all.tar.gz"
    sha256 "aaed5b36fa44c98fa2d1c148c4404170f30b64ddc06a39f381befe4301d4b9ff"
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
