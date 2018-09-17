{ stdenv, buildPythonPackage, fetchPypi }:

buildPythonPackage rec {
  pname = "antlr4-python3-runtime";
  version = "4.7.1";

  src = fetchPypi {
    inherit pname version;
    sha256 = "1b26b72c4492cef310542da10bf6b2ab4aa1775618fc6003f75b55ae9eaa3fd3";
  };

  doCheck = false;

  meta = with stdenv.lib; {
    description = "This is the Python 3 runtime for ANTLR";
    homepage = http://www.antlr.org;
    license = licenses.bsd3;
    maintainers = with maintainers; [ stesie ];
  };
}
