{ stdenv, buildPythonPackage, fetchPypi
, azure-cli-command-modules-nspkg
, azure-cli-core
, azure-mgmt-containerinstance
, azure-mgmt-loganalytics
, azure-mgmt-resource
, colorama
, pyyaml
, websocket_client
}:

buildPythonPackage rec {
  pname = "azure_cli_container";
  version = "0.3.2";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "0aw5pmzjwm3m34p27smr9mfvrq0kan29n9mpn12rkqqgs34im3kn";
  };

  propagatedBuildInputs = [
    azure-cli-command-modules-nspkg
    azure-cli-core
    azure-mgmt-containerinstance
    azure-mgmt-loganalytics
    azure-mgmt-resource
    colorama
    pyyaml
    websocket_client
  ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Microsoft Azure Command-Line Tools container Command Module";
    homepage = https://github.com/Azure/azure-cli;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
