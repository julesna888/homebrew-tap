cask "fcp-toolbox" do
  version "0.13.9"
  sha256 "be72a430d7f730bc580f6d5d6ba0023b961a492f5a8a5380487817e47704b378"

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
