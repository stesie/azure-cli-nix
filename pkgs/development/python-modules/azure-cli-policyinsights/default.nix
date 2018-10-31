{ stdenv, buildPythonPackage, fetchPypi, python
, azure-cli-command-modules-nspkg
, azure-cli-core
, azure-mgmt-policyinsights
}:

buildPythonPackage rec {
  pname = "azure_cli_policyinsights";
  version = "0.1.0";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "0q6ynqyr2kw4lllfwg0a29qvmcjk2b38cxkbdr7kf0j10f3vc55d";
  };

  propagatedBuildInputs = [
    azure-cli-command-modules-nspkg
    azure-cli-core
    azure-mgmt-policyinsights
  ];

  doCheck = false;
  
  meta = with stdenv.lib; {
    description = "Microsoft Azure Command-Line Tools Policy Insights Command Module";
    homepage = https://github.com/Azure/azure-cli;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
