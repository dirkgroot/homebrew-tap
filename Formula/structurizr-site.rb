class StructurizrSite < Formula
  desc "Static-site generator for C4 architecture models from Structurizr DSL"
  homepage "https://github.com/dirkgroot/structurizr-site"
  version "0.0.1-pre-alpha2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dirkgroot/structurizr-site/releases/download/v#{version}/structurizr-site-aarch64-apple-darwin.tar.gz"
      sha256 "b0d35beada18404c511f6884b074896296a999ca70e67aeecbf134c5fa035a75"
    else
      url "https://github.com/dirkgroot/structurizr-site/releases/download/v#{version}/structurizr-site-x86_64-apple-darwin.tar.gz"
      sha256 "8e3acf80c1319f8083b7beb28dccd9d939a57e02ae712aa13eb6b3ee319c6fb0"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/dirkgroot/structurizr-site/releases/download/v#{version}/structurizr-site-x86_64-unknown-linux-musl.tar.gz"
      sha256 "5bdc71fa4db4ba7d08227395012de89431f2beeacdac11c7a5efc3a881855cbc"
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
