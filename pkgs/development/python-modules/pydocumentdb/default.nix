{ stdenv, buildPythonPackage, fetchPypi, six, requests }:

buildPythonPackage rec {
  pname = "pydocumentdb";
  version = "2.3.2";

  src = fetchPypi {
    inherit pname version;
    sha256 = "1vly2f3qj4haxnqvvypjmi1slllrdn9d2dknval5z6xngrmy2137";
  };

  propagatedBuildInputs = [ six requests ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Azure DocumentDB Python SDK";
    homepage = https://github.com/Azure/azure-documentdb-python;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}

