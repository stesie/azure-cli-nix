{ stdenv, buildPythonPackage, fetchPypi, python
, azure-cli-command-modules-nspkg
, azure-cli-core
, azure-mgmt-relay
, six
}:

buildPythonPackage rec {
  pname = "azure_cli_relay";
  version = "0.1.2";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "05d4f51nini5qawzrv1jxkxbj7clnnw66ky0nfl2n2vksx6vxlfy";
  };

  propagatedBuildInputs = [
    azure-cli-command-modules-nspkg
    azure-cli-core
    azure-mgmt-relay
    six
  ];

  doCheck = false;
  
  meta = with stdenv.lib; {
    description = "Microsoft Azure Command-Line Tools Relay Command Module";
    homepage = https://github.com/Azure/azure-cli;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
