class PurrCanary < Formula
  desc "Transcribe audio files and URLs on this computer"
  homepage "https://github.com/gaetschwartz/purr"
  version "0.1.0-canary.366"
  license "MIT"

  on_macos do
    depends_on arch: :arm64

    url "https://github.com/gaetschwartz/purr/releases/download/canary-0.1.0-canary.366/purr-cli-macos-arm64-metal.tar.gz"
    sha256 "f0e5dea0b1efe8615aa3aa4e8c2b761dc7b774847ac7262cd5f72ea02252b0c5"
  end

  on_linux do
    depends_on arch: :x86_64

    url "https://github.com/gaetschwartz/purr/releases/download/canary-0.1.0-canary.366/purr-cli-linux-x64-vulkan.tar.gz"
    sha256 "dd1c0d7ba33ed841aeec4001f33cc1d0a1e014d563abae2f5425b7a46b74e069"
  end

  livecheck do
    skip "Rolling canary, republished by CI on every build"
  end

  conflicts_with "purr-canary-cuda", because: "both install a `purr` binary"
  conflicts_with "purr", because: "both install a `purr` binary"
  conflicts_with "purr-cuda", because: "both install a `purr` binary"

  def install
    libexec.install Dir["*"]
    if OS.linux?
      bin.install_symlink libexec/"purr"
    else
      bin.write_exec_script libexec/"purr"
    end
  end

  test do
    system bin/"purr", "--version"
  end
end
