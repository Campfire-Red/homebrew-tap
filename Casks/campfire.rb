cask "campfire" do
  version "0.5.0"
  sha256 "b253e084281d75294f571722e998b43cdc1edab058d03349fcdb63c13f73e984"

  url "https://github.com/Campfire-Red/Campfire/releases/download/v#{version}/Campfire_#{version}_aarch64.dmg"
  name "Campfire"
  desc "Peer-to-peer, end-to-end encrypted voice and text chat"
  homepage "https://campfire.red/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :sequoia

  app "Campfire.app"

  zap trash: [
    "~/Library/Application Support/red.campfire.app",
    "~/Library/Caches/red.campfire.app",
    "~/Library/LaunchAgents/Campfire.plist",
    "~/Library/Logs/red.campfire.app",
    "~/Library/WebKit/red.campfire.app",
  ]
end
