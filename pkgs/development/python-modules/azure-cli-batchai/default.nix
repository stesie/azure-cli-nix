{ stdenv, buildPythonPackage, fetchPypi
, azure-cli-command-modules-nspkg
, azure-cli-core
, azure-mgmt-batchai
, azure-mgmt-storage
, azure-storage-blob
, mock
, sshtunnel
}:

buildPythonPackage rec {
  pname = "azure_cli_batchai";
  version = "0.4.0";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "1kacgxmzf23ja9nynkirwqpsdys11rb46k9bb4nhcflmmfg1wf56";
  };

  propagatedBuildInputs = [
    azure-cli-command-modules-nspkg
    azure-cli-core
    azure-mgmt-batchai
    azure-mgmt-storage
    azure-storage-blob
    mock
    sshtunnel
  ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Microsoft Azure Batch AI Client Command-Line Tools";
    homepage = https://github.com/Azure/azure-cli;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
