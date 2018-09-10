{ stdenv, buildPythonPackage, fetchPypi
, azure-cli-command-modules-nspkg
, azure-cli-core
, azure-mgmt-redis
}:

buildPythonPackage rec {
  pname = "azure_cli_redis";
  version = "0.3.2";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "0z7bzfc23af1jf9wnim0nfqyb8sx5ah9xfg1rs2r8sfgx0ab0k12";
  };

  propagatedBuildInputs = [
    azure-cli-command-modules-nspkg
    azure-cli-core
    azure-mgmt-redis
  ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Microsoft Azure Command-Line Tools Redis Command Module";
    homepage = https://github.com/Azure/azure-cli;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
