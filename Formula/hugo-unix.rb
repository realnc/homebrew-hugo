class HugoUnix < Formula
  desc "Hugo command-line compiler, debugger and interpreter"
  homepage "https://www.generalcoffee.com/hugo"
  url "https://github.com/hugoif/hugo-unix/releases/download/v3.1.06/hugo-unix-3.1.06-source.tar.bz2"
  sha256 "429eac590a08645b9b91b4b77458702eec9d7f0aff4ae647662a50e0e95e4b54"
  license all_of: ["BSD-2-Clause", "LGPL-3.0-or-later"]
  head "https://github.com/hugoif/hugo-unix.git"

  depends_on "pkg-config" => :build
  depends_on "fluid-synth"
  depends_on "libopenmpt"
  depends_on "libsndfile"
  depends_on "mpg123"
  depends_on "ncurses"
  depends_on "sdl2"

  def install
    system "make", "ENABLE_AUDIO=yes", "MOD_BACKEND=mpt"
    bin.install "hc", "hd", "he"
  end

  test do
    system "#{bin}/hc"
    system "#{bin}/hd"
    system "#{bin}/he"
  end
end
