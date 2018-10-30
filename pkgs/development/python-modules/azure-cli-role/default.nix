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
  version = "2.1.8";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "1ha9zlgb3cd4d0m9x0ahl9z2qc7iipr5j4fg0p9q9hwxlxhkfb9j";
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
