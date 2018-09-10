{ stdenv, buildPythonPackage, fetchPypi
, azure-cli-command-modules-nspkg
, azure-cli-core
, azure-keyvault
, azure-mgmt-authorization
, azure-mgmt-compute
, azure-mgmt-keyvault
, azure-mgmt-marketplaceordering
, azure-mgmt-msi
, azure-mgmt-network
, azure-multiapi-storage
}:

buildPythonPackage rec {
  pname = "azure_cli_vm";
  version = "2.1.0";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "1pnqx7qyjxdv3zfjm8r7qlj6nm03by12n4xz714f5z7ir64mhjkx";
  };

  propagatedBuildInputs = [
    azure-cli-command-modules-nspkg
    azure-cli-core
    azure-keyvault
    azure-mgmt-authorization
    azure-mgmt-compute
    azure-mgmt-keyvault
    azure-mgmt-marketplaceordering
    azure-mgmt-msi
    azure-mgmt-network
    azure-multiapi-storage
  ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Microsoft Azure Command-Line Tools VM Command Module";
    homepage = https://github.com/Azure/azure-cli;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
