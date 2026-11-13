class AppDeploy < Formula
  desc "CLI for creating CI deployment trigger and build tags for mobile apps"
  homepage "https://github.com/infinum/app-deploy-script"
  url "https://github.com/infinum/app-deploy-script/archive/refs/tags/v2.2.2.tar.gz"
  sha256 "1a11a97ee9f741f9a0d774031abb705310b557215df81b2ed7eccaea9d1a7178"
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
