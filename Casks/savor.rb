cask "savor" do
  arch arm: "arm64", intel: "x64"

  version "0.6.46"
  sha256 arm:   "c49dea719a010851c27f7de45ed4c2de0c7f5c9e59d3d707074807b226d40a67",
         intel: "550c57c0cfd1c2e6d058709e601e2d8ba5b545676b7d724b651be005d00f32d4"

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

  app "Savor.app"

  # ~/.savor stays: it holds the projects list, paired devices and the worktrees of unmerged work.
  zap trash: [
    "~/Library/Application Support/Savor",
    "~/Library/Caches/savor-desktop-updater",
    "~/Library/Preferences/dev.savor.app.plist",
    "~/Library/Saved Application State/dev.savor.app.savedState",
  ]
end
