{ stdenv, buildPythonPackage, fetchPypi
, azure-cli-command-modules-nspkg
, azure-cli-core
, azure-mgmt-iothub
, azure-mgmt-iothubprovisioningservices
, pyopenssl
}:

buildPythonPackage rec {
  pname = "azure_cli_iot";
  version = "0.3.1";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "0djwhiyr8nvbzc70ij9h2y0m2fhfyz79habw429ifgnwa29x244l";
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
