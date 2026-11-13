cask "savor" do
  arch arm: "arm64", intel: "x64"

  version "0.6.47"
  sha256 arm:   "dce2ef6be91281ee724d8decbf0b25b1ea3bc8fda2482c8927ccf519e7dff1aa",
         intel: "a35ff3910af8c695d20cec6e7cfddfaa063177447a0d294bd668fb7a5e33cb1e"

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
