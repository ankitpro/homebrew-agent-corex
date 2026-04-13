# typed: false
# frozen_string_literal: true

# Homebrew formula for agent-corex.
#
# Tap:    brew tap ankitpro/agent-corex
# Install: brew install agent-corex
#
# This formula installs the pre-built binary released on GitHub.
# No Python or extra dependencies required.

class AgentCorex < Formula
  desc "Fast, accurate MCP tool router — detect, inject, and manage MCP servers for AI agents"
  homepage "https://github.com/ankitpro/agent-corex"
  version "4.0.0"
  license "MIT"

  on_macos do
    # arm64 binary; runs on Intel Macs via Rosetta 2
    url "https://github.com/ankitpro/agent-corex/releases/download/v#{version}/agent-corex-macos-arm64"
    sha256 "2f5b2bf9a1420870bc26e6b15e615f8442e0d2e61fcf81eb434550e291167e24"
  end

  on_linux do
    url "https://github.com/ankitpro/agent-corex/releases/download/v#{version}/agent-corex-linux-x86_64"
    sha256 "3180501ea6406ed4ec58270bc2608e18b9ef49b800982a42866b5fbeac210012"
  end

  def install
    if OS.mac?
      bin.install "agent-corex-macos-arm64" => "agent-corex"
    else
      bin.install "agent-corex-linux-x86_64" => "agent-corex"
    end
  end

  def caveats
    <<~EOS
      Get started:
        agent-corex login --key <your-api-key>
        agent-corex detect
        agent-corex init

      Docs: https://github.com/ankitpro/agent-corex
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/agent-corex version")
  end
end
