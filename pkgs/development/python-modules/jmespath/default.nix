{ stdenv, buildPythonPackage, fetchPypi, nose, ply }:

buildPythonPackage rec {
  pname = "jmespath";
  version = "0.9.3";

  src = fetchPypi {
    inherit pname version;
    sha256 = "0r7wc7fsxmlwzxx9j1j7rms06c6xs6d4sysirdhz1jk2mb4x90ba";
  };

  buildInputs = [ nose ];
  propagatedBuildInputs = [ ply ];

  meta = with stdenv.lib; {
    homepage = https://github.com/boto/jmespath;
    description = "JMESPath allows you to declaratively specify how to extract elements from a JSON document";
    license = licenses.mit;
  };
}
