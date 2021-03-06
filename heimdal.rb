class Heimdal < Formula
  homepage "http://www.h5l.org"
  url "http://www.h5l.org/dist/src/heimdal-1.6rc2.tar.gz"
  sha256 "8fe19e0f12ff0d0c2f20a6cf56727deaabd89db9c197288022fb489e103b730d"
  revision 1

  keg_only :provided_by_osx

  depends_on :x11 => :recommended

  def install
    args = %W[
      --disable-debug
      --disable-dependency-tracking
      --prefix=#{prefix}
    ]

    args << "--without-x" if build.without? "x11"

    system "./configure", *args
    system "make", "install"
  end
end
