{ stdenv, buildPythonPackage, fetchPypi
, azure-cli-command-modules-nspkg
, azure-cli-core
, azure-mgmt-monitor
}:

buildPythonPackage rec {
  pname = "azure_cli_monitor";
  version = "0.2.5";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "0yffa8cral1fbdmnif42y70kp4h4c71i08wh4sdmk6aamz5r080z";
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
