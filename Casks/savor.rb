cask "savor" do
  arch arm: "arm64", intel: "x64"

  version "0.6.48"
  sha256 arm:   "101c444614623e7d36c19a97cad1863736d5af5c204f7d6ac8f8dd7d7d49785e",
         intel: "c15a102aa52899d84dc8ab53ec6b52a729253e75a8e2e1853998e8461c204c2b"

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
