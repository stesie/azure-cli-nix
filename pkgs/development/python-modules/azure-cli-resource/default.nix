{ stdenv, buildPythonPackage, fetchPypi
, azure-cli-command-modules-nspkg
, azure-cli-core
, azure-mgmt-authorization
, azure-mgmt-managementgroups
}:

buildPythonPackage rec {
  pname = "azure_cli_resource";
  version = "2.1.5";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "0skiv4wdy1vk6j5mlbbvsrn11j8sn5s07r02csqjcqzb6q5fs0kr";
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
