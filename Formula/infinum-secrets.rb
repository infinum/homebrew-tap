class InfinumSecrets < Formula
  desc "Sync project secrets between local files and 1Password vaults"
  homepage "https://github.com/infinum/mobile-onepassword-secrets"
  url "git@github.com:infinum/mobile-onepassword-secrets.git",
      using:    :git,
      tag:      "v0.1.0",
      revision: "1543dfca0eef673e573ffad8e28d41f41779fdcd"
  license "Apache-2.0"

  depends_on "jq"

  def install
    libexec.install "sources"
    libexec.install "infinum-secrets.sh"
    (bin/"infinum-secrets").write_env_script libexec/"infinum-secrets.sh",
                                              INFINUM_SECRETS_SOURCES: libexec/"sources"
  end

  def caveats
    <<~EOS
      infinum-secrets also needs the 1Password CLI, which Homebrew can't
      declare as a formula dependency since it's cask-only:
        brew install --cask 1password-cli

      mobile-onepassword-secrets is a private repo, so installing (or
      upgrading) this formula requires an SSH key with read access to
      https://github.com/infinum/mobile-onepassword-secrets
    EOS
  end

  test do
    assert_match "infinum-secrets #{version}", shell_output("#{bin}/infinum-secrets --version")
  end
end
