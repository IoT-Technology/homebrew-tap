# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Toolkit < Formula
  desc "Toolkit is a IoT protocol client CLI for IoT developer and learners. CoAP、MQTT and NB-IoT protocol are currently supported. It supports colors, autocompletion, internationalization(chinese, english and german…) and multi-platforms"
  homepage "https://github.com/IoT-Technology/IoT-Toolkit"
  url "https://github.com/IoT-Technology/IoT-Toolkit/releases/download/0.7.2/toolkit-0.7.2-osx-x86_64.zip"
  sha256 "fb90b407d4383f1a58f05bde33a04653a94236a3a4d492441d17c1deb192ab08"
  license "Apache-2.0"
  version "0.7.2"

  # depends_on "cmake" => :build

  def install
    bash_completion.install "completion/toolkit_completion" => "toolkit"
    zsh_completion.install "completion/zsh/_toolkit" => "_toolkit"

    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/toolkit"
  end

  test do
    output = shell_output("#{bin}/toolkit --version")
    assert_match "toolkit/v0.7.2", output
  end
end
