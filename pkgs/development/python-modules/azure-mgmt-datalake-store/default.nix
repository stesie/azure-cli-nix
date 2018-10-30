{ stdenv, buildPythonPackage, fetchPypi
, azure-common
, azure-mgmt-datalake-nspkg
, msrestazure
}:

buildPythonPackage rec {
  pname = "azure_mgmt_datalake_store";
  version = "0.5.0";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "1pcmq1fix1g80jr2khg9hb79csc6ihrn3xwv4fdl7akyrlv85y9a";
  };

  propagatedBuildInputs = [
    azure-common
    azure-mgmt-datalake-nspkg
    msrestazure
  ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Microsoft Azure Data Lake Store Management Client Library for Python";
    homepage = https://github.com/Azure/azure-sdk-for-python;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
