{ stdenv, buildPythonPackage, fetchPypi, python, isPy27
, azure-common
, azure-nspkg
, cryptography
, python-dateutil
, requests
, futures
}:

buildPythonPackage rec {
  pname = "azure_multiapi_storage";
  version = "0.2.1";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "091qz206v9k6vb2lvr7shlhjsln711gplg8rf5f3wx6z35i2i5h4";
  };

  propagatedBuildInputs = [
    azure-common
    azure-nspkg
    cryptography
    python-dateutil
    requests
  ] ++ stdenv.lib.optional (isPy27) futures;

  postFixup = ''
    rm $out/${python.sitePackages}/azure/__init__.py
  '';

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Microsoft Azure Storage Client Library for Python with multi API version support.";
    homepage = https://github.com/Azure/azure-multiapi-storage-python;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
