{ stdenv, buildPythonPackage, fetchPypi
, azure-cli-command-modules-nspkg
, azure-cli-core
, azure-mgmt-storage
, azure-multiapi-storage
}:

buildPythonPackage rec {
  pname = "azure_cli_storage";
  version = "2.2.3";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "1srww6zr7aa4llbpkhz97k9ia55bqwz08f0qr11z8gisg5qn7nqz";
  };

  propagatedBuildInputs = [
    azure-cli-command-modules-nspkg
    azure-cli-core
    azure-mgmt-storage
    azure-multiapi-storage
  ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Microsoft Azure Command-Line Tools Storage Command Module";
    homepage = https://github.com/Azure/azure-cli;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
