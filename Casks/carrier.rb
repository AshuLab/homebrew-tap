cask "carrier" do
  version "0.20.0"

  on_arm do
    sha256 "f521ed1a56b824de430b40e65a2a242aaef4ce6b131fed62f51f519d280f11f2"
    url "https://github.com/AshuLab/carrier/releases/download/v#{version}/Carrier-#{version}.zip"
  end
  on_intel do
    sha256 "67afc7e638b8482dad0cab51e73e259b74df48b836bd04cb732d010a17da78a5"
    url "https://github.com/AshuLab/carrier/releases/download/v#{version}/Carrier-#{version}-intel.zip"
  end

  name "Carrier"
  desc "Mac app for Carrier, the autonomous epic orchestrator"
  homepage "https://github.com/AshuLab/carrier"

  auto_updates true
  depends_on formula: "carrier"
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
