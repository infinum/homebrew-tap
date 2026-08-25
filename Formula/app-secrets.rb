class AppSecrets < Formula
  desc "Sync project secrets between local files and 1Password vaults"
  homepage "https://github.com/infinum/mobile-onepassword-secrets"
  url "https://github.com/infinum/mobile-onepassword-secrets/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "1e6ca78320473c89e34ca0021fa04294f72cffa5f3b203052faacf3e7b3f806a"
  license "Apache-2.0"

  depends_on "jq"

  def install
    libexec.install "sources"
    libexec.install "app-secrets.sh"
    (bin/"app-secrets").write_env_script libexec/"app-secrets.sh",
                                         APP_SECRETS_SOURCES: libexec/"sources"
  end

  def caveats
    <<~EOS
      app-secrets also needs the 1Password CLI, which Homebrew can't
      declare as a formula dependency since it's cask-only:
        brew install --cask 1password-cli
    EOS
  end

  test do
    assert_match "app-secrets #{version}", shell_output("#{bin}/app-secrets --version")
  end
end
