{ stdenv, buildPythonPackage, fetchPypi
, azure-common
, azure-nspkg
, msrest
, msrestazure
}:

buildPythonPackage rec {
  pname = "azure_graphrbac";
  version = "0.51.1";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "1zx1b6cxl9x3m6j2f53qylbzfx6ka8f1ar971cjrvypa9zfz3h29";
  };

  propagatedBuildInputs = [
    azure-common
    azure-nspkg
    msrest
    msrestazure
  ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Microsoft Azure Graph RBAC Client Library for Python";
    homepage = https://github.com/Azure/azure-sdk-for-python;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
