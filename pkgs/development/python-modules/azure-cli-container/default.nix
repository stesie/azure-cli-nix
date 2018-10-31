{ stdenv, buildPythonPackage, fetchPypi, python
, azure-cli-command-modules-nspkg
, azure-cli-core
, azure-mgmt-authorization
, azure-mgmt-containerinstance
, azure-mgmt-loganalytics
, azure-mgmt-network
, azure-mgmt-resource
, colorama
, pyyaml
, websocket_client
}:

buildPythonPackage rec {
  pname = "azure_cli_container";
  version = "0.3.7";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "17rwwrwy33qf20s4h905ibpxhbfzgpjgr3qqrhs17q6lzr67dnfx";
  };

  postFixup = ''
    rm "$out/lib/${python.libPrefix}/site-packages/azure/__init__.py"
    rm "$out/lib/${python.libPrefix}/site-packages/azure/cli/__init__.py"
    rm "$out/lib/${python.libPrefix}/site-packages/azure/cli/command_modules/__init__.py"
  '';

  propagatedBuildInputs = [
    azure-cli-command-modules-nspkg
    azure-cli-core
    azure-mgmt-authorization
    azure-mgmt-containerinstance
    azure-mgmt-loganalytics
    azure-mgmt-network
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
