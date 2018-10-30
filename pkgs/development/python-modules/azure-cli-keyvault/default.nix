{ stdenv, buildPythonPackage, fetchPypi
, azure-cli-command-modules-nspkg
, azure-cli-core
, azure-graphrbac
, azure-keyvault
, azure-mgmt-keyvault
, pyopenssl
}:

buildPythonPackage rec {
  pname = "azure_cli_keyvault";
  version = "2.2.5";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "0l8yi0l90sr939w84smqj4vzzgsbf091v0czsprknxp0ci1ll77r";
  };

  propagatedBuildInputs = [
    azure-cli-command-modules-nspkg
    azure-cli-core
    azure-graphrbac
    azure-keyvault
    azure-mgmt-keyvault
    pyopenssl
  ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Microsoft Azure Command-Line Tools Keyvault Command Module";
    homepage = https://github.com/Azure/azure-cli;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
