{ stdenv, buildPythonPackage, fetchPypi, python
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
  version = "2.2.6";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "0x3l66j93nfcxchac6p3xb0crzmss9r7qk71bmlbc50amw5dzm85";
  };

  postFixup = ''
    rm "$out/lib/${python.libPrefix}/site-packages/azure/__init__.py"
    rm "$out/lib/${python.libPrefix}/site-packages/azure/cli/__init__.py"
    rm "$out/lib/${python.libPrefix}/site-packages/azure/cli/command_modules/__init__.py"
  '';

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
