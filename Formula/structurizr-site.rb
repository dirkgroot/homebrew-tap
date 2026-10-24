class StructurizrSite < Formula
  desc "Static-site generator for C4 architecture models from Structurizr DSL"
  homepage "https://github.com/dirkgroot/structurizr-site"
  version "0.0.0-test"

  depends_on "structurizr"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dirkgroot/structurizr-site/releases/download/v#{version}/structurizr-site-aarch64-apple-darwin.tar.gz"
      sha256 "3e9519c929d2b9c3c3bbd59fce3397f56689ff6c1308cf291a08e7f5e04cd852"
    else
      url "https://github.com/dirkgroot/structurizr-site/releases/download/v#{version}/structurizr-site-x86_64-apple-darwin.tar.gz"
      sha256 "679222efdb36e413c52d2092e3f121f05506cc2aa87120b3a3e43811e8fa90d8"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/dirkgroot/structurizr-site/releases/download/v#{version}/structurizr-site-x86_64-unknown-linux-musl.tar.gz"
      sha256 "f838e0b8ff70a2672815791039ce0a1256020328162b2dd1d565973d4f13e290"
    end
  end

  def install
    bin.install "structurizr-site"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/structurizr-site --version")
  end

  livecheck do
    url :stable
    strategy :github_latest
  end
end
