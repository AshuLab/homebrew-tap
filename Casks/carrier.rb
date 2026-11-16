cask "carrier" do
  version "0.9.0"
  sha256 "ca6bb526515c3beb8f66b94c2866d0ef6b08b00e02fbb5aad3f719fda6ef8bbd"

  url "https://github.com/AshuLab/carrier/releases/download/v#{version}/Carrier-#{version}.zip"
  name "Carrier"
  desc "Mac app for Carrier, the autonomous epic orchestrator"
  homepage "https://github.com/AshuLab/carrier"

  auto_updates true
  depends_on formula: "carrier"
  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "Carrier.app"

  # The app is signed ad hoc, not notarized (ADR 0017), and Homebrew quarantines what it downloads, so
  # Gatekeeper would stop it. Homebrew's own repository would not accept this step; this tap does.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Carrier.app"]
  end

  zap trash: [
    "~/Library/Caches/dev.ashulab.carrier",
    "~/Library/Preferences/dev.ashulab.carrier.plist",
  ]
end
