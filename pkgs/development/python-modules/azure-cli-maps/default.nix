{ stdenv, buildPythonPackage, fetchPypi, python
, azure-cli-command-modules-nspkg
, azure-cli-core
, azure-mgmt-maps
}:

buildPythonPackage rec {
  pname = "azure_cli_maps";
  version = "0.3.2";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "1l7arwv36j5zyy027g9wl6sv5r2hriw205w85lzjqxkdwi6dqcyj";
  };

  propagatedBuildInputs = [
    azure-cli-command-modules-nspkg
    azure-cli-core
    azure-mgmt-maps
  ];

  doCheck = false;
  
  meta = with stdenv.lib; {
    description = "Microsoft Azure Command-Line Tools Maps Command Module";
    homepage = https://github.com/Azure/azure-cli;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
