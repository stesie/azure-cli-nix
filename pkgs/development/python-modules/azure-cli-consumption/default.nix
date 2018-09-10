{ stdenv, buildPythonPackage, fetchPypi
, azure-cli-command-modules-nspkg
, azure-cli-core
, azure-mgmt-consumption
}:

buildPythonPackage rec {
  pname = "azure_cli_consumption";
  version = "0.4.0";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "12a9bkv2irp7hk6zl3ci3nw9bahz4cqkbfhz9cllbaq1mcwc6wsf";
  };

  propagatedBuildInputs = [
    azure-cli-command-modules-nspkg
    azure-cli-core
    azure-mgmt-consumption
  ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Microsoft Azure Command-Line Tools Consumption Command Module";
    homepage = https://github.com/Azure/azure-cli;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
