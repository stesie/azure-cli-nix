{ stdenv, buildPythonPackage, fetchPypi
, azure-cli-command-modules-nspkg
, azure-cli-core
, azure-mgmt-recoveryservices
, azure-mgmt-recoveryservicesbackup
}:

buildPythonPackage rec {
  pname = "azure_cli_backup";
  version = "1.2.1";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "0m4jhs2dj4fl8rd6nc5fyldzs94whk1ah07788c2ip569zpja365";
  };

  propagatedBuildInputs = [
    azure-cli-command-modules-nspkg
    azure-cli-core
    azure-mgmt-recoveryservices
    azure-mgmt-recoveryservicesbackup
  ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Microsoft Azure Command-Line Tools Recovery Services Command Module";
    homepage = https://github.com/Azure/azure-cli;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
