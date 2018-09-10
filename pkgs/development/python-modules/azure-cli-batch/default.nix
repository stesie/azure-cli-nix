{ stdenv, buildPythonPackage, fetchPypi
, azure-batch
, azure-cli-core
, azure-cli-command-modules-nspkg
, azure-mgmt-batch
, azure-mgmt-keyvault
}:

buildPythonPackage rec {
  pname = "azure_cli_batch";
  version = "3.2.4";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "04hhqcxvx5yq5iawvcf0dannz342mjrzbanh859y6n62za6khgxj";
  };

  propagatedBuildInputs = [
    azure-batch
    azure-cli-core
    azure-cli-command-modules-nspkg
    azure-mgmt-batch
    azure-mgmt-keyvault
  ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Microsoft Azure Command-Line Tools Batch Command Module";
    homepage = https://github.com/Azure/azure-cli;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
