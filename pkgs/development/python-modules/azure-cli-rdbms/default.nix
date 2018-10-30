{ stdenv, buildPythonPackage, fetchPypi
, azure-cli-command-modules-nspkg
, azure-cli-core
, azure-mgmt-rdbms
, six
}:

buildPythonPackage rec {
  pname = "azure_cli_rdbms";
  version = "0.3.2";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "18kwfjbwd9vgm6lfcicy264p6r215k08cjbjmyd49734wfjcvxzf";
  };

  propagatedBuildInputs = [
    azure-cli-command-modules-nspkg
    azure-cli-core
    azure-mgmt-rdbms
    six
  ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Microsoft Azure Command-Line Tools MySQL and PostgreSQL Command Module";
    homepage = https://github.com/Azure/azure-cli;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
