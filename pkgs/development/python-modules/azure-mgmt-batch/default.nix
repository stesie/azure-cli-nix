{ stdenv, buildPythonPackage, fetchPypi
, azure-common
, azure-mgmt-nspkg
, msrestazure
}:

buildPythonPackage rec {
  pname = "azure_mgmt_batch";
  version = "5.0.1";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "0qc10a3sac5k9sgh2fmya4kdkb6b1ap8kr23gbhal1qd30jy4hnr";
  };

  propagatedBuildInputs = [
    azure-common
    azure-mgmt-nspkg
    msrestazure
  ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Microsoft Azure Batch Management Client Library for Python";
    homepage = https://github.com/Azure/azure-sdk-for-python;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
