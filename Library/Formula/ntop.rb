require 'formula'

class Ntop < Formula
  homepage 'http://ntop.org'
  url 'http://sourceforge.net/projects/ntop/files/ntop/Stable/ntop-5.0.1.tar.gz/download'
  version '5.0.1'
  sha1 'bbb8de893b1d0bb3c20785445ff62c7dbf398d0b'

  depends_on 'rrdtool'
  depends_on 'geoip'
  depends_on 'wget'

  def install
    # ENV.j1  # if your formula's build system can't parallelize

    system "./autogen.sh"

    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    # system "cmake", ".", *std_cmake_args
    system "make install" # if this fails, try separate make/make install steps
  end

  def test
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test ntop`.
    system "ntop -h"
  end
end
