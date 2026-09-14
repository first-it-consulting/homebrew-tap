class Hlw < Formula
  desc "Launch AI coding agents against configurable endpoints, picking the model at launch"
  homepage "https://github.com/first-it-consulting/hlw"
  url "https://github.com/first-it-consulting/hlw/archive/refs/tags/v0.1.3.tar.gz"
  version "0.1.3"
  sha256 "4c3b1995dbb92e03230d65a41feb99befccfe163dfc354a960f86b390524d9b1"
  license "MIT"

  depends_on "go" => :build

  def install
    ldflags = %W[
      -s -w
      -X github.com/first-it-consulting/hlw/cmd.Version=#{version}
      -X github.com/first-it-consulting/hlw/cmd.Commit=v#{version}
      -X github.com/first-it-consulting/hlw/cmd.Date=#{time.iso8601}
    ]
    system "go", "build", "-ldflags", ldflags.join(" "), "-o", bin/"hlw", "."
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/hlw --version")
  end
end
