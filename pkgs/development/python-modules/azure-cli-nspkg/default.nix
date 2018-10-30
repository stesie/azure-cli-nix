{ stdenv, buildPythonPackage, fetchPypi
, azure-nspkg
}:

buildPythonPackage rec {
  pname = "azure_cli_nspkg";
  version = "3.0.3";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "0b1dny3sabizf4x72dcanapr6pmsbqm7lpqias1qccaal0s5q29l";
  };

  propagatedBuildInputs = [
    azure-nspkg
  ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Microsoft Azure CLI Namespace Package";
    homepage = https://github.com/Azure/azure-cli;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
