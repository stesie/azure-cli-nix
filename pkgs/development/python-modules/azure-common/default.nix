{ stdenv, buildPythonPackage, fetchPypi, isPyPy
, azure-nspkg
}:

buildPythonPackage rec {
  pname = "azure-common";
  version = "1.1.14";
  disabled = isPyPy;

  src = fetchPypi {
    inherit pname version;
    extension = "zip";
    sha256 = "0ibnhid0ajnmn7nzbbkjh1jl5iyqa1bnzn1j01nl1vgxkj3wi3sg";
  };

  propagatedBuildInputs = [ azure-nspkg ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Microsoft Azure Client Library for Python (Common)";
    homepage = https://github.com/Azure/azure-sdk-for-python;
    license = licenses.mit;
    maintainers = with maintainers; [ olcai stesie ];
  };
}
