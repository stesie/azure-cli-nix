{ stdenv, buildPythonPackage, fetchPypi
, azure-cli-command-modules-nspkg
, azure-cli-core
, azure-mgmt-eventhub
, six
}:

buildPythonPackage rec {
  pname = "azure_cli_eventhubs";
  version = "0.2.1";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "13hxqznrpgapcv8s3jw0zn1sf9piflhql4zmh49i4bnzlj8n3n08";
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
