{ stdenv, buildPythonPackage, fetchPypi
, azure-cli-command-modules-nspkg
, azure-cli-core
, azure-mgmt-servicebus
, six
}:

buildPythonPackage rec {
  pname = "azure_cli_servicebus";
  version = "0.2.2";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "1203rgr4j10b84iwci7b5a67i2vz28qq0pg6sjlndyy7ip0zw18h";
  };

  propagatedBuildInputs = [
    azure-cli-command-modules-nspkg
    azure-cli-core
    azure-mgmt-servicebus
    six
  ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Microsoft Azure Command-Line Tools Service Bus Command Module";
    homepage = https://github.com/Azure/azure-cli;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
