{ stdenv, buildPythonPackage, fetchPypi
}:

buildPythonPackage rec {
  pname = "azure_nspkg";
  version = "3.0.2";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    python = "py3";
    sha256 = "0a2y8cvddngld0icksq4whkwjs37ll0zxiwz6syixv80rb56181i";
  };

  propagatedBuildInputs = [
  ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Microsoft Azure Namespace Package";
    homepage = https://github.com/Azure/azure-sdk-for-python;
    license = licenses.mit;
    maintainers = with maintainers; [ olcai stesie ];
  };
}
