{ stdenv, buildPythonPackage, fetchPypi
, azure-cli-command-modules-nspkg
, azure-cli-core
, azure-mgmt-sql
, azure-mgmt-storage
, six
}:

buildPythonPackage rec {
  pname = "azure_cli_sql";
  version = "2.1.1";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "13s9fyz19jm9lqxkd5rwnl2b4qkc6w95sac683mvk00g51b29762";
  };

  propagatedBuildInputs = [
    azure-cli-command-modules-nspkg
    azure-cli-core
    azure-mgmt-sql
    azure-mgmt-storage
    six
  ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Microsoft Azure Command-Line Tools SQL Command Module";
    homepage = https://github.com/Azure/azure-cli;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
