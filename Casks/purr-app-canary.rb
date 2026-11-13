cask "purr-app-canary" do
  version "0.1.0-canary.342"
  sha256 "232c0a9f1e1d60b106153e78ce7f781f076b0644f002a2d09d28ec5437bf0260"

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
