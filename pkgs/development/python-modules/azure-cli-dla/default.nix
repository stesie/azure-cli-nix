{ stdenv, buildPythonPackage, fetchPypi
, azure-cli-command-modules-nspkg
, azure-cli-core
, azure-mgmt-datalake-analytics
, azure-mgmt-datalake-store
}:

buildPythonPackage rec {
  pname = "azure_cli_dla";
  version = "0.2.3";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "169jrf16b2kz10ly1zhn9asnhid39mm069l9df3vby4m5mqadqhn";
  };

  propagatedBuildInputs = [
    azure-cli-command-modules-nspkg
    azure-cli-core
    azure-mgmt-datalake-analytics
    azure-mgmt-datalake-store
  ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Microsoft Azure Command-Line Tools Data Lake Analytics Command Module";
    homepage = https://github.com/Azure/azure-cli;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
