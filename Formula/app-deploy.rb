class AppDeploy < Formula
  desc "CLI for creating CI deployment trigger and build tags for mobile apps"
  homepage "https://github.com/infinum/app-deploy-script"
  url "https://github.com/infinum/app-deploy-script/archive/refs/tags/v2.2.1.tar.gz"
  sha256 "dead5aa2fea31e12ca2c7133a10705453174e9876918357c6fb7067db060c001"
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
