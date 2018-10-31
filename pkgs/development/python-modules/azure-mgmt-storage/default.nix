{ stdenv, buildPythonPackage, fetchPypi
, azure-common
, azure-mgmt-nspkg
, msrestazure
}:

buildPythonPackage rec {
  pname = "azure_mgmt_storage";
  version = "2.0.0rc4";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "1lq6g078hyl68bjdyd0gac66w8c4j79kq4bk3c4d3gpk5x06y45m";
  };

  propagatedBuildInputs = [
    azure-common
    azure-mgmt-nspkg
    msrestazure
  ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Microsoft Azure Storage Management Client Library for Python";
    homepage = https://github.com/Azure/azure-sdk-for-python;
    license = licenses.mit;
    maintainers = with maintainers; [ olcai stesie ];
  };
}
