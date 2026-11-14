cask "purr-app-canary" do
  version "0.1.0-canary.354"
  sha256 "7976dd9d80b4ce0b473e15a7293135a7920acdb5a6c9b6f67318f4b75d178a21"

  url "https://github.com/gaetschwartz/purr/releases/download/canary-#{version}/purr-desktop-macos-arm64-metal.dmg"
  name "Purr"
  desc "Transcribe audio files and URLs on this computer"
  homepage "https://github.com/gaetschwartz/purr"

  livecheck do
    skip "Rolling canary, republished by CI on every build"
  end

  conflicts_with cask: "purr-app"
  depends_on arch: :arm64
  depends_on formula: "gaetschwartz/tap/purr-canary"

  app "purr-app.app"

  # The app is not notarized, so Gatekeeper would refuse to open it.
  postflight_steps do
    run "/usr/bin/xattr",
        args: ["-dr", "com.apple.quarantine", "{{appdir}}/purr-app.app"]
  end
end
