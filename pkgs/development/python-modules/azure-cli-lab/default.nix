{ stdenv, buildPythonPackage, fetchPypi
, azure-cli-command-modules-nspkg
, azure-cli-core
, azure-graphrbac
, azure-mgmt-devtestlabs
}:

buildPythonPackage rec {
  pname = "azure_cli_lab";
  version = "0.1.2";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "02sriz2sa2h7lvq46sq7hjq8g7yrl1z74jq90pnwggyc9v0bbs09";
  };

  propagatedBuildInputs = [
    azure-cli-command-modules-nspkg
    azure-cli-core
    azure-graphrbac
    azure-mgmt-devtestlabs
  ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Microsoft Azure Command-Line Tools DevTestLabs Command Module";
    homepage = https://github.com/Azure/azure-cli;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
