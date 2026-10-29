# Maintained by hand. Downloads the rolling "tip" prerelease that the Tip
# workflow in dexchat/dex rebuilds on every push to main.
cask "dex@tip" do
  version :latest
  sha256 :no_check

  on_macos do
    on_arm do
      url "https://github.com/dexchat/dex/releases/download/tip/dex_darwin_arm64.tar.gz"
    end
    on_intel do
      url "https://github.com/dexchat/dex/releases/download/tip/dex_darwin_amd64.tar.gz"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/dexchat/dex/releases/download/tip/dex_linux_arm64.tar.gz"
    end
    on_intel do
      url "https://github.com/dexchat/dex/releases/download/tip/dex_linux_amd64.tar.gz"
    end
  end

  name "dex"
  desc "IRC/TUI client for dexchat (tip of main)"
  homepage "https://github.com/dexchat/dex"

  conflicts_with cask: "dex"

  binary "dex"

  caveats <<~EOS
    This is an unstable build of the latest commit on main. Upgrade it with:

      brew upgrade --cask --greedy dex@tip

    If macOS blocks dexchat, enable it by running the following command:

      xattr -d com.apple.quarantine "$(command -v dex)"
  EOS
end
