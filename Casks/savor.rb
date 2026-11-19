cask "savor" do
  arch arm: "arm64", intel: "x64"

  version "0.6.50"
  sha256 arm:   "a73f41975be539f0e4f081bbbece31f91f6a59e4650a26f0e12cb417f4c5edf8",
         intel: "4694e1fb99b26f944da5f87be55abe651cd1a307a70ed7f38b5a5671726b8016"

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
