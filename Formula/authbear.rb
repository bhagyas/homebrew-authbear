class Authbear < Formula
  desc "CLI auth broker with keychain-backed credentials"
  homepage "https://github.com/bhagyas/authbear"
  url "https://github.com/bhagyas/authbear/archive/refs/tags/v0.1.3.tar.gz"
  sha256 "20c26b20e65d283ffe162a9e5967dffd9714433bb71bbd089ea3111ac7ab8b68"
  license "NOASSERTION"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "./cmd/authbear"
  end

  test do
    output = shell_output("#{bin}/authbear --help")
    assert_match "authbear", output
  end
end
