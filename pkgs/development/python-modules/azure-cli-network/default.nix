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
  version = "2.2.4";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "0z3aha978r7cwydjnp6cnahr70nsjqg0wzzxn8wfgjj23kz3j5xl";
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
