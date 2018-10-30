{ stdenv, buildPythonPackage, fetchPypi
, azure-cli-command-modules-nspkg
, azure-cli-core
, azure-mgmt-eventhub
, six
}:

buildPythonPackage rec {
  pname = "azure_cli_eventhubs";
  version = "0.3.0";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "1v2zdwf7wz7qf9m97a7xd9m0inbax7wx5awcik2j8k6j2j8sbbll";
  };

  propagatedBuildInputs = [
    azure-cli-command-modules-nspkg
    azure-cli-core
    azure-mgmt-eventhub
    six
  ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Microsoft Azure Command-Line Tools Event Hubs Command Module";
    homepage = https://github.com/Azure/azure-cli;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
