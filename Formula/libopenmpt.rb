class Libopenmpt < Formula
  desc "A C++ and C library and CLI tool for decoding tracked music files (modules.)"
  homepage "https://lib.openmpt.org"
  url "https://lib.openmpt.org/files/libopenmpt/src/libopenmpt-0.4.3+release.autotools.tar.gz"
  version "0.4.3"
  sha256 "d77443a279003921d6f0c4edb30d1e9dda387983f44113a6d58f623c1e6942ae"

  depends_on "flac"
  depends_on "libogg"
  depends_on "libsndfile"
  depends_on "libvorbis"
  depends_on "mpg123"
  depends_on "pkg-config"
  depends_on "sdl2"

  def install
    system "./configure", "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}",
                          "--disable-examples",
                          "--disable-doxygen-doc",
                          "--with-mpg123",
                          "--with-ogg",
                          "--with-vorbis",
                          "--with-vorbisfile",
                          "--without-portaudio",
                          "--without-portaudiocpp",
                          "--with-sdl2",
                          "--with-sndfile",
                          "--with-flac",
                          "--with-zlib"
    system "make", "install" # if this fails, try separate make/make install steps
  end

  test do
    system "#{bin}/openmpt123", "--version"
  end
end
