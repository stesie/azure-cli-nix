{ stdenv, buildPythonPackage, fetchPypi
, azure-common
, azure-storage-nspkg
, cryptography
, python-dateutil
, requests
}:

buildPythonPackage rec {
  pname = "azure_storage_common";
  version = "1.3.0";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "0sqrr7raavnfhvdbxqbyxhp2qv7wsprg2mnf628gjaz8323af4m4";
  };

  propagatedBuildInputs = [
    azure-common
    azure-storage-nspkg
    cryptography
    python-dateutil
    requests
  ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Microsoft Azure Storage Common Client Library for Python";
    homepage = https://github.com/Azure/azure-storage-python;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
