{ stdenv, buildPythonPackage, fetchPypi, python
, azure-cli-command-modules-nspkg
, azure-cli-core
, azure-mgmt-botservice
, azure-mgmt-web
}:

buildPythonPackage rec {
  pname = "azure_cli_botservice";
  version = "0.1.1";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "0zrk1rs8cspr6rchjfpfm6i1lhaxdgf1y3l118jvbk8702bb6ify";
  };

  propagatedBuildInputs = [
    azure-cli-command-modules-nspkg
    azure-cli-core
    azure-mgmt-botservice
    azure-mgmt-web
  ];

  doCheck = false;
  
  meta = with stdenv.lib; {
    description = "Microsoft Azure Command-Line Tools Bot Services Command Module";
    homepage = https://github.com/azure/azure-cli;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
