{ stdenv, buildPythonPackage, fetchPypi
, azure-common
, azure-nspkg
, cryptography
, msrest
, msrestazure
, requests
}:

buildPythonPackage rec {
  pname = "azure_keyvault";
  version = "0.3.7";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "1bx7i5infknjbjvq12x1xwgp6rc3nc4rwnbpg9ggvla5mjkp6wdk";
  };

  propagatedBuildInputs = [
    azure-common
    azure-nspkg
    cryptography
    msrest
    msrestazure
    requests
  ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Microsoft Azure Key Vault Client Library for Python";
    homepage = https://github.com/Azure/azure-sdk-for-python;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
