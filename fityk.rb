require "formula"

class Fityk < Formula
  homepage "http://fityk.nieto.pl"
  url "https://github.com/wojdyr/fityk/releases/download/v1.2.9/fityk-1.2.9.tar.bz2"
  sha1 "fcf58b055d2a5b0b3aefed72dd096c91564afd0d"

  depends_on "boost" => :build
  depends_on "lua"
  depends_on "zlib"
  depends_on "xylib"
  depends_on "wxWidgets"
  depends_on "readline" => :recommended
  depends_on "gnuplot" => :optional

  def install
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    system bin/"fityk", "--version"
    system bin/"xyconvert", "--version"
    system bin/"cfityk", "--version"
  end
end
