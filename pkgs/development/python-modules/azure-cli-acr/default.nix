{ stdenv, buildPythonPackage, fetchPypi
, azure-cli-command-modules-nspkg
, azure-cli-core
, azure-mgmt-containerregistry
, azure-mgmt-storage
, azure-storage-blob
}:

buildPythonPackage rec {
  pname = "azure_cli_acr";
  version = "2.1.0";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "0mprxk87pmwkqbz1jd9m4kd0njgf901ghf0zzp6qwdj542hjkd5z";
  };

  propagatedBuildInputs = [
    azure-cli-command-modules-nspkg
    azure-cli-core
    azure-mgmt-containerregistry
    azure-mgmt-storage
    azure-storage-blob
  ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Microsoft Azure Command-Line Tools ACR Command Module";
    homepage = https://github.com/Azure/azure-cli;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
