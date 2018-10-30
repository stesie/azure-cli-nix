{ stdenv, buildPythonPackage, fetchPypi, python
, azure-cli-command-modules-nspkg
, azure-cli-core
, azure-mgmt-containerregistry
, azure-mgmt-storage
, azure-mgmt-web
, pyopenssl
, six
, urllib3
, vsts-cd-manager
, xmltodict
}:

buildPythonPackage rec {
  pname = "azure_cli_appservice";
  version = "0.2.5";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "0m7zm0snfh8f1msi5ivv5azkm3l91ixcy84g1ldv2jfxdg9y1d9d";
  };

  postFixup = ''
    rm "$out/lib/${python.libPrefix}/site-packages/azure/__init__.py"
    rm "$out/lib/${python.libPrefix}/site-packages/azure/cli/__init__.py"
    rm "$out/lib/${python.libPrefix}/site-packages/azure/cli/command_modules/__init__.py"
  '';

  propagatedBuildInputs = [
    azure-cli-command-modules-nspkg
    azure-cli-core
    azure-mgmt-containerregistry
    azure-mgmt-storage
    azure-mgmt-web
    pyopenssl
    six
    urllib3
    vsts-cd-manager
    xmltodict
  ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Microsoft Azure Command-Line Tools AppService Command Module";
    homepage = https://github.com/Azure/azure-cli;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
