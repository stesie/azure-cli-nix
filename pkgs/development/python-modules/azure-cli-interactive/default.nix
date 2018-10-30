{ stdenv, buildPythonPackage, fetchPypi
, applicationinsights
, azure-cli-command-modules-nspkg
, azure-cli-core
, jmespath
, prompt_toolkit
, pyyaml
, six
}:

buildPythonPackage rec {
  pname = "azure_cli_interactive";
  version = "0.3.31";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "1s312j4rzcgpbf0nyh4l39p4mqmi7p5l9y4g4595zdz61flw6gw4";
  };

  propagatedBuildInputs = [
    applicationinsights
    azure-cli-command-modules-nspkg
    azure-cli-core
    jmespath
    prompt_toolkit
    pyyaml
    six
  ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Microsoft Azure Command-Line Interactive Shell";
    homepage = https://github.com/Azure/azure-cli;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
