{ stdenv, buildPythonPackage, fetchPypi
, applicationinsights
, azure-cli-command-modules-nspkg
, azure-cli-core
}:

buildPythonPackage rec {
  pname = "azure_cli_feedback";
  version = "2.1.4";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "1pyw4nbaywhi96a9cp63xvj2bix9xlhhaf7rfjy9mcm1xwz4zbn8";
  };

  propagatedBuildInputs = [
    applicationinsights
    azure-cli-command-modules-nspkg
    azure-cli-core
  ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Microsoft Azure Command-Line Tools Feedback Command Module";
    homepage = https://github.com/Azure/azure-cli;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
