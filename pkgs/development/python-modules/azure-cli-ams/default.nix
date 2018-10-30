{ stdenv, buildPythonPackage, fetchPypi
, azure-cli-command-modules-nspkg
, azure-cli-core
, azure-graphrbac
, azure-mgmt-media
}:

buildPythonPackage rec {
  pname = "azure_cli_ams";
  version = "0.2.4";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "0bj2n2vsz2hrhrr9i35s12363kbl3wlprydbmqgxcrv8ij22s7dk";
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
