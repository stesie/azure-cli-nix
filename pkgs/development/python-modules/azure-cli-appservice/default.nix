{ stdenv, buildPythonPackage, fetchPypi
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
  version = "0.1.36";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "0ghi4yi2x22gk64sx7sivpvnvqcvjjchckydla1glicr1piwzn7a";
  };

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
