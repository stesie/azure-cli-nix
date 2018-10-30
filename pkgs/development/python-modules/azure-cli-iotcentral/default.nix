{ stdenv, buildPythonPackage, fetchPypi, python
, azure-cli-command-modules-nspkg
, azure-cli-core
, azure-mgmt-iotcentral
}:

buildPythonPackage rec {
  pname = "azure_cli_iotcentral";
  version = "0.1.3";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "01c8wbbqcmw17i8c304xj7bkdrw5jxp5kv69ab0j2aw0jl36b96y";
  };

  propagatedBuildInputs = [
    azure-cli-command-modules-nspkg
    azure-cli-core
    azure-mgmt-iotcentral
  ];

  doCheck = false;
  
  meta = with stdenv.lib; {
    description = "Microsoft Azure Command-Line Tools IoT Central Command Module";
    homepage = https://github.com/Azure/azure-cli;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
