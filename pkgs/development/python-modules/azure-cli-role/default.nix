{ stdenv, buildPythonPackage, fetchPypi
, azure-cli-command-modules-nspkg
, azure-cli-core
, azure-graphrbac
, azure-keyvault
, azure-mgmt-authorization
, azure-mgmt-monitor
, pytz
}:

buildPythonPackage rec {
  pname = "azure_cli_role";
  version = "2.1.0";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "1wwcljnx9v365xypfvrgf7fb5lfisaaw9kgyy930q6wyran5ivmg";
  };

  propagatedBuildInputs = [
    azure-cli-command-modules-nspkg
    azure-cli-core
    azure-graphrbac
    azure-keyvault
    azure-mgmt-authorization
    azure-mgmt-monitor
    pytz
  ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Microsoft Azure Command-Line Tools Role Command Module";
    homepage = https://github.com/Azure/azure-cli;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
