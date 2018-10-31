{ stdenv, buildPythonPackage, fetchPypi, python
, azure-cli-command-modules-nspkg
, azure-cli-core
, azure-mgmt-signalr
}:

buildPythonPackage rec {
  pname = "azure_cli_signalr";
  version = "1.0.0";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "1qyamlfk1l4rxvmyf3s5nq9r4rswf527cl1hnhs8wn08gw85fad5";
  };

  propagatedBuildInputs = [
    azure-cli-command-modules-nspkg
    azure-cli-core
    azure-mgmt-signalr
  ];

  doCheck = false;
  
  meta = with stdenv.lib; {
    description = "Microsoft Azure Command-Line Tools SignalR Command Module";
    homepage = https://github.com/Azure/azure-cli;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
