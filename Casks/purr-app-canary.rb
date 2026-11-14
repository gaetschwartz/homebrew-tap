cask "purr-app-canary" do
  version "0.1.0-canary.350"
  sha256 "a939bb0635f7a65c90614a056316885748d07888b3bcc94fd2e07870bb6638d1"

  url "https://github.com/gaetschwartz/purr/releases/download/canary-#{version}/purr-desktop-macos-arm64-metal.dmg"
  name "Purr"
  desc "Transcribe audio files and URLs with Whisper"
  homepage "https://github.com/gaetschwartz/purr"

  livecheck do
    skip "Rolling canary, republished by CI on every build"
  end

  conflicts_with cask: "purr-app"
  depends_on arch: :arm64
  depends_on formula: "gaetschwartz/tap/purr-canary"

  app "purr-app.app"

  # The app is not notarized, so Gatekeeper would refuse to open it.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/purr-app.app"]
  end
end
