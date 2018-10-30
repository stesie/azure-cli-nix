{ stdenv, buildPythonPackage, fetchPypi
, azure-cli-command-modules-nspkg
, azure-cli-core
, azure-mgmt-dns
, azure-mgmt-network
, azure-mgmt-trafficmanager
, mock
}:

buildPythonPackage rec {
  pname = "azure_cli_network";
  version = "2.2.7";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "0g61075pwmqnrwg1xg56lpwiac3nsy1cr03xs3zrxpk2kkq9hymv";
  };

  propagatedBuildInputs = [
    azure-cli-command-modules-nspkg
    azure-cli-core
    azure-mgmt-dns
    azure-mgmt-network
    azure-mgmt-trafficmanager
    mock
  ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Microsoft Azure Command-Line Tools Network Command Module";
    homepage = https://github.com/Azure/azure-cli;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
