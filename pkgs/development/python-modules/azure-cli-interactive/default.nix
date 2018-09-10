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
  version = "0.3.28";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "0na9x8ivwdzkqf61v3h785sllhwjanl5c8v6pqvbj4cqcwpjd7lp";
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
