cask "savor" do
  arch arm: "arm64", intel: "x64"

  version "0.6.51"
  sha256 arm:   "4aa29d1b4777a3bde755d832af48df76d60ff2650086c7775777ed6b3f00a4e0",
         intel: "4a0472670b8b8c5dcac8df490b3e4afcf78ca5a685161fbdab3196e24b964064"

  url "https://github.com/robinchoice/savor/releases/download/v#{version}/Savor-#{version}-#{arch}.dmg",
      verified: "github.com/robinchoice/savor/"
  name "Savor"
  desc "Workspace for coding agents that report back"
  homepage "https://savor.pleasance.org/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: ">= :ventura"

  app "Savor.app"

  # ~/.savor stays: it holds the projects list, paired devices and the worktrees of unmerged work.
  zap trash: [
    "~/Library/Application Support/Savor",
    "~/Library/Caches/savor-desktop-updater",
    "~/Library/Preferences/dev.savor.app.plist",
    "~/Library/Saved Application State/dev.savor.app.savedState",
  ]
end
