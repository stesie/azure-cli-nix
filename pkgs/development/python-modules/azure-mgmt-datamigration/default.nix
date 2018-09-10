{ stdenv, buildPythonPackage, fetchPypi
, azure-common
, azure-mgmt-nspkg
, msrestazure
}:

buildPythonPackage rec {
  pname = "azure-mgmt-datamigration";
  version = "0.1.0";

  src = fetchPypi {
    inherit pname version;
    extension = "zip";
    sha256 = "1pq5rn32yvrf5kqjafnj0kc92gpfg435w2l0k7cm8gvlja4r4m77";
  };

  propagatedBuildInputs = [
    azure-common
    azure-mgmt-nspkg
    msrestazure
  ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Microsoft Azure Data Migration Client Library for Python";
    homepage = https://github.com/Azure/azure-sdk-for-python;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
