# Shelf's Homebrew cask. Lives in the imrajjain/homebrew-tap repository;
# scripts/release.sh updates the version and checksum on every release.
#
#   brew install --cask imrajjain/tap/shelf
cask "shelf" do
  version "0.2.2"
  sha256 "c8a9a2cdc982124ff9dd1ac5da7b03ea3b7ea0fc4583132150c88b12dc941c9b"

  url "https://github.com/imrajjain/my-home-shelf/releases/download/v#{version}/Shelf-#{version}.zip"
  name "Shelf"
  desc "Quiet place for what you want to read, watch and remember"
  homepage "https://shelf.rajjain.fyi"

  depends_on macos: ">= :sonoma"
  # Shelf updates itself with Sparkle once installed.
  auto_updates true

  app "Shelf.app"

  # Shelf isn't notarized by Apple (that needs a paid developer account), so
  # clear the download mark macOS would otherwise stop it on.
  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/Shelf.app"]
  end

  zap trash: [
    "~/Library/Application Support/Shelf",
    "~/Library/Caches/Shelf",
    "~/Library/Preferences/com.imrajjain.shelf.plist",
  ]
end
