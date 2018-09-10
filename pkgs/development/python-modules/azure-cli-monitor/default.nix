{ stdenv, buildPythonPackage, fetchPypi
, azure-cli-command-modules-nspkg
, azure-cli-core
, azure-mgmt-monitor
}:

buildPythonPackage rec {
  pname = "azure_cli_monitor";
  version = "0.2.2";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "0v1xfld4p92akipc9zrqfyzj2zfaaymi25fwmy81xfi3dlli3sgp";
  };

  propagatedBuildInputs = [
    azure-cli-command-modules-nspkg
    azure-cli-core
    azure-mgmt-monitor
  ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Microsoft Azure Command-Line Tools Monitor Command Module";
    homepage = https://github.com/Azure/azure-cli;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
