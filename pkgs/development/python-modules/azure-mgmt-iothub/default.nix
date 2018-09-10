{ stdenv, buildPythonPackage, fetchPypi
, azure-common
, azure-mgmt-nspkg
, msrestazure
}:

buildPythonPackage rec {
  pname = "azure-mgmt-iothub";
  version = "0.5.0";

  src = fetchPypi {
    inherit pname version;
    extension = "zip";
    sha256 = "1ghl5ln9w2zn2m61gjmd497wkzw0rzg409vxx6hg0i38xm182f08";
  };

  propagatedBuildInputs = [ azure-common azure-mgmt-nspkg msrestazure ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Microsoft Azure IoTHub Management Client Library for Python";
    homepage = https://github.com/Azure/azure-sdk-for-python;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
