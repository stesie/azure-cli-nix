{ stdenv, buildPythonPackage, fetchPypi
, azure-cli-command-modules-nspkg
, azure-cli-core
, azure-graphrbac
, azure-mgmt-media
}:

buildPythonPackage rec {
  pname = "azure_cli_ams";
  version = "0.2.3";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "1bds3843dpib3xhdw2nyagryhnn22hcq44pm4kgkrsgg47b3yqi7";
  };

  propagatedBuildInputs = [
    azure-cli-command-modules-nspkg
    azure-cli-core
    azure-graphrbac
    azure-mgmt-media
  ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Microsoft Azure Command-Line Tools AMS Command Module";
    homepage = https://github.com/Azure/azure-cli;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
