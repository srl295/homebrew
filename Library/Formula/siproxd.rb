require "formula"

# Documentation: https://github.com/Homebrew/homebrew/wiki/Formula-Cookbook
#                /usr/local/Library/Contributions/example-formula.rb
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Siproxd < Formula
  homepage ""
  url "http://sourceforge.net/projects/siproxd/files/siproxd/0.8.1/siproxd-0.8.1.tar.gz/download"
  sha1 "6226ee04b6f0080bb323cb7364ed758d1cbcbba1"

  # depends_on "cmake" => :build
  depends_on "libosip"
  # depends_on :x11 # if your formula requires any X11/XQuartz components
  patch :p1 do
    url "https://gist.githubusercontent.com/srl295/9630439/raw/c6782aea7dddbecd5b85581eae374eaa86320142/brew-siproxd-0.8.1.patch"
    sha1 "9af455ac6d9f2b038d9993efa92c88671f2ce0eb"
  end

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel

    # Remove unrecognized options if warned by configure
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--with-included-libtool",
                          "--prefix=#{prefix}"
    # system "cmake", ".", *std_cmake_args
    system "make", "install" # if this fails, try separate make/make install steps
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test siproxd`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
