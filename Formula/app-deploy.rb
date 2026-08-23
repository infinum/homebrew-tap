class AppDeploy < Formula
  desc "CLI for creating CI deployment trigger and build tags for mobile apps"
  homepage "https://github.com/infinum/app-deploy-script"
  url "https://github.com/infinum/app-deploy-script/archive/refs/tags/v2.2.0.tar.gz"
  sha256 "e0d0a8b8c68477ab1845cb9d1fe688e0597237ab86efb06e25993eb916df5125"
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
