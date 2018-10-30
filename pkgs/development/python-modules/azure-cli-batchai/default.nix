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
  version = "0.4.4";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "14aw947yvdszdancwyrh25vid5ajhn5c76ppm17fwkv9xwa7gidq";
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
