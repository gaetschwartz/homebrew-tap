class PurrATNightly < Formula
  desc "Transcribe audio files and URLs with Whisper"
  homepage "https://github.com/gaetschwartz/purr"
  version "2026.11.12"
  license "MIT"

  on_macos do
    depends_on arch: :arm64

    url "https://github.com/gaetschwartz/purr/releases/download/nightly-2026.11.12/purr-cli-macos-arm64-metal.tar.gz"
    sha256 "67d9b1a6a0ab4a49054342ca9d464e6e1893c1b7ec177ebd581b59ae98adc6a7"
  end

  on_linux do
    depends_on arch: :x86_64

    url "https://github.com/gaetschwartz/purr/releases/download/nightly-2026.11.12/purr-cli-linux-x64-all.tar.gz"
    sha256 "dfb6dd1fa5aa5f3a4fd7067a007ecd490a3c6cecc830c60675da4068c416fe78"
  end

  livecheck do
    skip "Rolling nightly, republished by CI on every build"
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
