{ stdenv, buildPythonPackage, fetchPypi
, azure-cli-command-modules-nspkg
, azure-cli-core
, azure-graphrbac
, azure-mgmt-authorization
, azure-mgmt-compute
, azure-mgmt-containerservice
, paramiko
, pyyaml
, scp
, six
, sshtunnel
}:

buildPythonPackage rec {
  pname = "azure_cli_acs";
  version = "2.0.34";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "1cbgbn3iii8bxy844kvgzrgpy8b89djj69gxmj4m7vlfvzjcawgc";
  };

  propagatedBuildInputs = [
    azure-cli-command-modules-nspkg
    azure-cli-core
    azure-graphrbac
    azure-mgmt-authorization
    azure-mgmt-compute
    azure-mgmt-containerservice
    paramiko
    pyyaml
    scp
    six
    sshtunnel
  ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Microsoft Azure Command-Line Tools ACS Command Module";
    homepage = https://github.com/Azure/azure-cli;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
