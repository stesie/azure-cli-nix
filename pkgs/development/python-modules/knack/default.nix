{ stdenv, buildPythonPackage, fetchPypi
, argcomplete
, colorama
, jmespath
, pygments
, pyyaml
, six
, tabulate
}:

buildPythonPackage rec {
  pname = "knack";
  version = "0.4.4";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "18r88z4zr50xdjjivvn7vpdqzgyh9rr0z1x25lmwsfpv0sgzw75j";
  };

  propagatedBuildInputs = [
    argcomplete
    colorama
    jmespath
    pygments
    pyyaml
    six
    tabulate
  ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "A Command-Line Interface framework";
    homepage = https://github.com/microsoft/knack;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}

