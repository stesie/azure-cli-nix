{ stdenv, buildPythonPackage, fetchPypi
, azure-cli-command-modules-nspkg
, azure-cli-core
, azure-mgmt-cosmosdb
, pydocumentdb
}:

buildPythonPackage rec {
  pname = "azure_cli_cosmosdb";
  version = "0.2.1";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "0ki6sc22fy0gy23j8nms2sd0r09gv1m4826mby8xm8wljygzjxpx";
  };

  propagatedBuildInputs = [
    azure-cli-command-modules-nspkg
    azure-cli-core
    azure-mgmt-cosmosdb
    pydocumentdb
  ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Microsoft Azure Command-Line Tools Cosmos DB Command Module";
    homepage = https://github.com/Azure/azure-cli;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
