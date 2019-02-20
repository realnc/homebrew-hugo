class HugoUnix < Formula
  desc "Hugo compiler, debugger and CLI interpreter"
  homepage "https://www.generalcoffee.com/hugo"
  url "https://bitbucket.org/0branch/hugo-unix/downloads/hugo-unix-3.1.04.tar.bz2"
  version "3.1.04"
  sha256 "92b1ba037bec71b6c65b5964368a4b693f530598c93a6494c4c3c300ee3b6e72"

  depends_on "pkg-config"
  depends_on "sdl2"
  depends_on "fluid-synth"
  depends_on "mpg123"
  depends_on "libopenmpt"
  depends_on "libsndfile"

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
