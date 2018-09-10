{ stdenv, buildPythonPackage, fetchPypi
, adal
, keyring
, msrest
}:

buildPythonPackage rec {
  pname = "msrestazure";
  version = "0.4.34";

  src = fetchPypi {
    inherit pname version;
    sha256 = "1r3dkqd0isfgc21994xb5qk80skspv2rr4jdj2mr9c6mxh1lmjag";
  };

  propagatedBuildInputs = [ adal keyring msrest ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "AutoRest swagger generator Python client runtime. Azure-specific module.";
    homepage = https://github.com/Azure/msrestazure-for-python;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
