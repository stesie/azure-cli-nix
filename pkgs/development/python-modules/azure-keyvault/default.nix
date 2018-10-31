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
  version = "1.1.0";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "0gbi43573kkif47d790nqdslskvvy6c2wvw9wzgljs44vr637ify";
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
