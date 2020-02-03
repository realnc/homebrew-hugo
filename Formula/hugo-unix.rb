class HugoUnix < Formula
  desc "Hugo command-line compiler, debugger and interpreter"
  homepage "https://www.generalcoffee.com/hugo"
  url "https://github.com/0branch/hugo-unix/releases/download/v3.1.05/hugo-unix-3.1.05-source.tar.bz2"
  version "3.1.05"
  sha256 "e06e7b063c9fc3458dbee1860751489fafc2dcd755e0f443ae42b7971ec80872"

  depends_on "pkg-config" => :build
  depends_on "sdl2"
  depends_on "fluid-synth"
  depends_on "mpg123"
  depends_on "libopenmpt"
  depends_on "libsndfile"
  depends_on "ncurses"

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
