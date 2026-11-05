class Hlw < Formula
  desc "Launch AI coding agents against configurable endpoints, picking the model at launch"
  homepage "https://github.com/first-it-consulting/hlw"
  url "https://github.com/first-it-consulting/hlw/archive/refs/tags/v0.1.4.tar.gz"
  version "0.1.4"
  sha256 "d94c2c0a0d7c7106229d036605901471b8aa0348dfdcc34659241e1d37d901a6"
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
