# Gerado por scripts/render-homebrew-formula.py a partir de
# scripts/homebrew/tmjlite.rb.in (repo TMJPlatform) — não edite no tap.
class Tmjlite < Formula
  desc "Embedded SQL database with git-style branches of data (CLI)"
  homepage "https://tmjlite.com.br"
  version "0.6.3"
  # Binário proprietário da TMJ Sistemas (uso e redistribuição sem modificação).
  license :cannot_represent

  on_macos do
    url "https://github.com/TMJacometti/tmjlite/releases/download/v0.6.3/tmjlite-cli-macos-arm64-0.6.3.tar.gz"
    sha256 "6f34a2b925950ed53c59e239b5be7d7d428e1f9800ff9330abcb8348782863f5"

    depends_on arch: :arm64
  end

  on_linux do
    url "https://github.com/TMJacometti/tmjlite/releases/download/v0.6.3/tmjlite-cli-linux-x64-0.6.3.tar.gz"
    sha256 "ce93e03a2446097a768a83d172c4113f5d579958200402ec7549ec3aadc90953"

    depends_on arch: :x86_64
  end

  def install
    # O .tar.gz tem uma pasta só (tmjlite-cli-<plataforma>/); o Homebrew já
    # entra nela. Binário pré-compilado: no macOS, assinado com Developer ID
    # e notarizado.
    bin.install "tmjlite"
    doc.install "QUICKSTART.txt" if File.exist?("QUICKSTART.txt")
  end

  test do
    assert_match "tmjlite #{version}", shell_output("#{bin}/tmjlite --version")
  end
end
