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
  version = "2.3.9";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "0jm8mjsdz39ryabpvxi8vpldc5gg6x3zlpacy9913z02q8c94102";
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
