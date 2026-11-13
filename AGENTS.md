# homebrew-tap

## Purpose & links

- Homebrew tap with the cask `savor` (`Casks/savor.rb`) for the macOS app of [robinchoice/savor](https://github.com/robinchoice/savor), Apple Silicon and Intel.
- Linux has no cask: Savor's landing page offers `site/install.sh` in the savor repo instead.

## Checks

`test.yml` audits the cask (`brew audit --cask --online --strict`), installs it on macOS and checks the app's signature and notarization. There is no local check without a Mac.

## Deploy

- Nothing to deploy: Homebrew reads the cask from `main`.
- `bump.yml` runs every two hours, moves the cask to Savor's latest release with the SHA-256 GitHub records for its assets, pushes as `github-actions[bot]` and then starts `test.yml`. Don't bump by hand.

## Pitfalls

- The bump matches the lines `version` and `sha256 arm:`/`intel:` by their exact indentation. Keep that layout, or change the `sed` in `bump.yml` with it.
- GitHub turns scheduled workflows off after 60 days without commits in the repo. If Savor goes that long without a release, re-enable `bump.yml` in the Actions tab.
- `zap` leaves `~/.savor` alone on purpose: it holds the projects list, paired devices and worktrees of unmerged work.
