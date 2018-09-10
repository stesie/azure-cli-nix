{ stdenv, buildPythonPackage, fetchPypi
, azure-common
, azure-mgmt-nspkg
, msrestazure
}:

buildPythonPackage rec {
  pname = "azure-mgmt-iothubprovisioningservices";
  version = "0.2.0";

  src = fetchPypi {
    inherit pname version;
    extension = "zip";
    sha256 = "07drnyn5jik89059kk03lp5k3bbc4vvjwc70y92siark3kysqdwc";
  };

  propagatedBuildInputs = [
    azure-common
    azure-mgmt-nspkg
    msrestazure
  ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Microsoft Azure IoTHub Provisioning Services Client Library for Python";
    homepage = https://github.com/Azure/azure-sdk-for-python;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
