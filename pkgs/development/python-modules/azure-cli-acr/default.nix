{ stdenv, buildPythonPackage, fetchPypi
, azure-cli-command-modules-nspkg
, azure-cli-core
, azure-mgmt-containerregistry
, azure-mgmt-storage
, azure-storage-blob
}:

buildPythonPackage rec {
  pname = "azure_cli_acr";
  version = "2.1.7";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "10jdzrz6qx2vnlzjrfmn333b2a1kk79dhlbzyz0jsxv1zh4ly14i";
  };

  propagatedBuildInputs = [
    azure-cli-command-modules-nspkg
    azure-cli-core
    azure-mgmt-containerregistry
    azure-mgmt-storage
    azure-storage-blob
  ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Microsoft Azure Command-Line Tools ACR Command Module";
    homepage = https://github.com/Azure/azure-cli;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
