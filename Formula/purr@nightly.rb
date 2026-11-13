class PurrATNightly < Formula
  desc "Transcribe audio files and URLs with Whisper"
  homepage "https://github.com/gaetschwartz/purr"
  version "2026.11.13"
  license "MIT"

  on_macos do
    depends_on arch: :arm64

    url "https://github.com/gaetschwartz/purr/releases/download/nightly-2026.11.13/purr-cli-macos-arm64-metal.tar.gz"
    sha256 "1a9a38fd5ffe1e796def5e7e546306ee1c4a6092608a0043fc35eba664b70bee"
  end

  on_linux do
    depends_on arch: :x86_64

    url "https://github.com/gaetschwartz/purr/releases/download/nightly-2026.11.13/purr-cli-linux-x64-all.tar.gz"
    sha256 "c7407d36fb7b77f8e66d298347fec6115b47a935a4e1c0dea41087a865676927"
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
