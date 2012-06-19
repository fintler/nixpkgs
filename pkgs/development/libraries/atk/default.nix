{ stdenv, fetchurl, pkgconfig, perl, glib }:

stdenv.mkDerivation rec {
  name = "atk-2.4.0";

  src = fetchurl {
    url = mirror://gnome/sources/atk/2.4/atk-2.4.0.tar.xz;
    sha256 = "13c87l4nghmj05f6v2z5vmngmdzzi71wjr7sv1ybryx9fplrq7h9";
  };

  buildNativeInputs = [ pkgconfig perl ];

  propagatedBuildInputs = [ glib ];

  meta = {
    description = "ATK, the accessibility toolkit";

    longDescription = ''
      ATK is the Accessibility Toolkit.  It provides a set of generic
      interfaces allowing accessibility technologies such as screen
      readers to interact with a graphical user interface.  Using the
      ATK interfaces, accessibility tools have full access to view and
      control running applications.
    '';

    homepage = http://library.gnome.org/devel/atk/;

    license = "LGPLv2+";

    maintainers = with stdenv.lib.maintainers; [ raskin urkud ];
    platforms = stdenv.lib.platforms.linux;
  };

}