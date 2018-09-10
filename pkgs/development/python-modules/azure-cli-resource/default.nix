{ stdenv, buildPythonPackage, fetchPypi
, azure-cli-command-modules-nspkg
, azure-cli-core
, azure-mgmt-authorization
, azure-mgmt-managementgroups
}:

buildPythonPackage rec {
  pname = "azure_cli_resource";
  version = "2.0.32";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "0happxaw0pkysszh2s94wbklinrd7wv6xzvs210vyzx6sf2n88fa";
  };

  propagatedBuildInputs = [
    azure-cli-command-modules-nspkg
    azure-cli-core
    azure-mgmt-authorization
    azure-mgmt-managementgroups
  ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Microsoft Azure Command-Line Tools Resource Command Module";
    homepage = https://github.com/Azure/azure-cli;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
