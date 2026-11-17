cask "savor" do
  arch arm: "arm64", intel: "x64"

  version "0.6.49"
  sha256 arm:   "6573e0b490d7e689c18c7c2295f165a98bfef48152f7c404addbcb4587ddef57",
         intel: "ab92a6b8cc7d1720be8ca3c2dfc76a316f17caec463092b211f0fb6e121ba962"

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
