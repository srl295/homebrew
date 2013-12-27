require 'formula'

class GedcomParse < Formula
  homepage 'http://gedcom-parse.sourceforge.net'
  url 'http://sourceforge.net/projects/gedcom-parse/files/gedcom-parse/0.90.0/gedcom-parse-0.90.0.tar.gz/download'
  sha1 'c24e993367c7386034bea599a489003494e766f9'

  def install
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    system "make", "check"
  end
end
