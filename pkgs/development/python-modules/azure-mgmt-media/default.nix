{ stdenv, buildPythonPackage, fetchPypi
, azure-common
, azure-mgmt-nspkg
, msrestazure
}:

buildPythonPackage rec {
  pname = "azure-mgmt-media";
  version = "1.0.0rc1";

  src = fetchPypi {
    inherit pname version;
    extension = "zip";
    sha256 = "15a3d23jxjmz7ad0vl88smgrkh51cysmfcf1vmw0cfiwz8fbz7iq";
  };

  propagatedBuildInputs = [
    azure-common
    azure-mgmt-nspkg
    msrestazure
  ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Microsoft Azure Media Services Client Library for Python";
    homepage = https://github.com/Azure/azure-sdk-for-python;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
