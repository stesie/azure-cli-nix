{ stdenv, buildPythonPackage, fetchPypi
, azure-cli-command-modules-nspkg
, azure-cli-core
, azure-mgmt-iothub
, azure-mgmt-iothubprovisioningservices
, pyopenssl
}:

buildPythonPackage rec {
  pname = "azure_cli_iot";
  version = "0.3.3";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "1wv9rfky5h8870kwad4ilz6gs4fc8c3myfxq198cnkw18ivv8cv3";
  };

  propagatedBuildInputs = [
    azure-cli-command-modules-nspkg
    azure-cli-core
    azure-mgmt-iothub
    azure-mgmt-iothubprovisioningservices
    pyopenssl
  ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Microsoft Azure Command-Line Tools IoT Command Module";
    homepage = https://github.com/Azure/azure-cli;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
