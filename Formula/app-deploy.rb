class AppDeploy < Formula
  desc "CLI for creating CI deployment trigger and build tags for mobile apps"
  homepage "https://github.com/infinum/app-deploy-script"
  url "https://github.com/infinum/app-deploy-script/archive/refs/tags/v2.2.3.tar.gz"
  sha256 "fa1f604d75e6b8f5885209bbf159e253ac9478dbd946eb3602e3e354b6ddbfb4"
  license "Apache-2.0"

  def install
    libexec.install "app-deploy.sh" => "app-deploy"
    libexec.install "sources"
    bin.write_exec_script libexec/"app-deploy"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/app-deploy --version")
  end
end
