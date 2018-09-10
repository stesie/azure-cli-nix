{ stdenv, buildPythonPackage, fetchPypi
, azure-cli-command-modules-nspkg
, azure-cli-core
, azure-graphrbac
, azure-keyvault
, azure-mgmt-compute
, azure-mgmt-keyvault
, azure-mgmt-network
, azure-mgmt-servicefabric
, azure-mgmt-storage
, pyopenssl
}:

buildPythonPackage rec {
  pname = "azure_cli_servicefabric";
  version = "0.1.0";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "1s3msmd9152zl6rpzivqfi1w3l92ky09mdpmaclx40fsapcw5x17";
  };

  propagatedBuildInputs = [
    azure-cli-command-modules-nspkg
    azure-cli-core
    azure-graphrbac
    azure-keyvault
    azure-mgmt-compute
    azure-mgmt-keyvault
    azure-mgmt-network
    azure-mgmt-servicefabric
    azure-mgmt-storage
    pyopenssl
  ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Microsoft Azure Service Fabric Command-Line Tools";
    homepage = https://github.com/Azure/azure-cli;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
