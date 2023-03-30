# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Toolkit < Formula
  desc "Toolkit is a IoT protocol client CLI for IoT developer and learners. CoAP、MQTT and NB-IoT protocol are currently supported. It supports colors, autocompletion, internationalization(chinese, english and german…) and multi-platforms"
  homepage "https://github.com/IoT-Technology/IoT-Toolkit"
  url "https://github.com/IoT-Technology/IoT-Toolkit/releases/download/0.6.5/toolkit-0.6.5-osx-x86_64.zip"
  sha256 "c4187f086143f186fbf11649cc53066f6a3a618dbd419453e894a3cd27b72e57"
  license "Apache-2.0"
  version "0.6.5"

  # depends_on "cmake" => :build

  def install
    bash_completion.install "completion/toolkit_completion" => "toolkit"
    zsh_completion.install "completion/zsh/_toolkit" => "_toolkit"

    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/toolkit"
  end

  test do
    output = shell_output("#{bin}/toolkit --version")
    assert_match "toolkit/v0.6.5", output
  end
end
