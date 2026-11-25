# Gerado por scripts/render-homebrew-formula.py a partir de
# scripts/homebrew/tmjlite.rb.in (repo TMJPlatform) — não edite no tap.
class Tmjlite < Formula
  desc "Embedded SQL database with git-style branches of data (CLI)"
  homepage "https://tmjlite.com.br"
  version "0.6.0"
  # Binário proprietário da TMJ Sistemas (uso e redistribuição sem modificação).
  license :cannot_represent

  on_macos do
    url "https://github.com/TMJacometti/tmjlite/releases/download/v0.6.0/tmjlite-cli-macos-arm64-0.6.0.tar.gz"
    sha256 "ece8e920452e755dc597cac5469d6a847102321da1db1360641512f8284cdb7c"

    depends_on arch: :arm64
  end

  on_linux do
    url "https://github.com/TMJacometti/tmjlite/releases/download/v0.6.0/tmjlite-cli-linux-x64-0.6.0.tar.gz"
    sha256 "29938db4adbe9534d5e68da389a05217e23e0bfd305333590c25d33cb08bf72b"

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
