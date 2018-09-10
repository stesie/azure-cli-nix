{ stdenv, buildPythonPackage, fetchPypi
, azure-cli-command-modules-nspkg
, azure-cli-core
, whoosh
}:

buildPythonPackage rec {
  pname = "azure_cli_find";
  version = "0.2.12";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "07g880xslb8sqwjp8j7bdm4pn8shnhw604qap5afcmmv7lfg36kk";
  };

  propagatedBuildInputs = [
    azure-cli-command-modules-nspkg
    azure-cli-core
    whoosh
  ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Microsoft Azure Command-Line Tools Find Command Module";
    homepage = https://github.com/Azure/azure-cli;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
