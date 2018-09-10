{ stdenv, buildPythonPackage, fetchPypi
, azure-cli-command-modules-nspkg
, azure-cli-core
, azure-mgmt-rdbms
, six
}:

buildPythonPackage rec {
  pname = "azure_cli_rdbms";
  version = "0.3.1";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "0lly8jq4zrglbwbmv4aws4q82wqfmxcp2jjvzj12ls6v2gbm24pd";
  };

  propagatedBuildInputs = [
    azure-cli-command-modules-nspkg
    azure-cli-core
    azure-mgmt-rdbms
    six
  ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Microsoft Azure Command-Line Tools MySQL and PostgreSQL Command Module";
    homepage = https://github.com/Azure/azure-cli;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
