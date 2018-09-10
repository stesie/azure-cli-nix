{ stdenv, buildPythonPackage, fetchPypi, python, isPy3k, six }:

buildPythonPackage rec {
  pname = "isodate";
  version = "0.6.0";

  src = fetchPypi {
    inherit pname version;
    sha256 = "1n7jkz68kk5pwni540pr5zdh99bf6ywydk1p5pdrqisrawylldif";
  };

  propagatedBuildInputs = [ six ];

  # Judging from SyntaxError
  doCheck = !(isPy3k);

  checkPhase = ''
    ${python.interpreter} -m unittest discover -s src/isodate/tests
  '';

  meta = with stdenv.lib; {
    description = "ISO 8601 date/time parser";
    homepage = http://cheeseshop.python.org/pypi/isodate;
    license = licenses.bsd3;
    maintainers = with maintainers; [ stesie ];
  };
}
