class AppSecrets < Formula
  desc "Sync project secrets between local files and 1Password vaults"
  homepage "https://github.com/infinum/mobile-onepassword-secrets"
  url "git@github.com:infinum/mobile-onepassword-secrets.git",
      using:    :git,
      tag:      "v0.1.0",
      revision: "988f69a46f132ab47b46fed76844abb61759c305"
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

      mobile-onepassword-secrets is a private repo, so installing (or
      upgrading) this formula requires an SSH key with read access to
      https://github.com/infinum/mobile-onepassword-secrets
    EOS
  end

  test do
    assert_match "app-secrets #{version}", shell_output("#{bin}/app-secrets --version")
  end
end
