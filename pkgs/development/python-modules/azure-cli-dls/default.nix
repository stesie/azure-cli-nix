{ stdenv, buildPythonPackage, fetchPypi
, azure-cli-command-modules-nspkg
, azure-cli-core
, azure-datalake-store
, azure-mgmt-datalake-store
}:

buildPythonPackage rec {
  pname = "azure_cli_dls";
  version = "0.1.1";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "03mzb9k0yn6pgiarw5clmcw7h4dajlwml6mnlpnwzzwlfqpjlb4p";
  };

  propagatedBuildInputs = [
    azure-cli-command-modules-nspkg
    azure-cli-core
    azure-datalake-store
    azure-mgmt-datalake-store
  ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Microsoft Azure Command-Line Tools Data Lake Store Command Module";
    homepage = https://github.com/Azure/azure-cli;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
