{ stdenv, buildPythonPackage, fetchPypi
, azure-cli-command-modules-nspkg
, azure-cli-core
, azure-mgmt-datalake-analytics
, azure-mgmt-datalake-store
}:

buildPythonPackage rec {
  pname = "azure_cli_dla";
  version = "0.2.2";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "06n4kjmw3m6wp5x5nb180v7qpvnvspk3cn68cx8rq66rpasaivkk";
  };

  propagatedBuildInputs = [
    azure-cli-command-modules-nspkg
    azure-cli-core
    azure-mgmt-datalake-analytics
    azure-mgmt-datalake-store
  ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Microsoft Azure Command-Line Tools Data Lake Analytics Command Module";
    homepage = https://github.com/Azure/azure-cli;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
