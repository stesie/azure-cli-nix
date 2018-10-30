{ stdenv, buildPythonPackage, fetchPypi, isPyPy
, azure-nspkg
, msrestazure
}:

buildPythonPackage rec {
  pname = "azure_common";
  version = "1.1.16";
  format = "wheel";
  disabled = isPyPy;

  src = fetchPypi {
    inherit pname version format;
    sha256 = "0vjpzksb659cyg15k0sdhndg063sqb9kablnn3xfjkpbf4d64269";
  };

  propagatedBuildInputs = [
    azure-nspkg
    msrestazure
  ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Microsoft Azure Client Library for Python (Common)";
    homepage = https://github.com/Azure/azure-sdk-for-python;
    license = licenses.mit;
    maintainers = with maintainers; [ olcai stesie ];
  };
}
