cask "fcp-toolbox" do
  version "0.13.8"
  sha256 "4fd100e1a587dbbadd10077245cb2ab464a19ad3bf4d5fa03353ea33957e2237"

  url "https://github.com/julesna888/fcp-toolbox/releases/download/v#{version}/FCP-Toolbox-#{version}.dmg"
  name "FCP Toolbox"
  desc "Free tools for Final Cut Pro editors: free up space, convert media, pre-edit checks"
  homepage "https://github.com/julesna888/fcp-toolbox"

  depends_on macos: ">= :sonoma"

  app "FCP Toolbox.app"

  # The app is not notarized (no paid Apple Developer account), so remove the download quarantine flag.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/FCP Toolbox.app"]
  end

  zap trash: "~/Library/Application Support/FCP Toolbox"
end
