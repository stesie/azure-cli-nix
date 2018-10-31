{ stdenv, buildPythonPackage, fetchPypi, isPy27
, azure-common
, azure-storage-common
, azure-storage-nspkg
, futures
}:

buildPythonPackage rec {
  pname = "azure_storage_blob";
  version = "1.3.1";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "1p1ch0sw6ipvxix2dbxrn8jlkc5703mhfr0zv4q5i7vqznmmi01h";
  };

  propagatedBuildInputs = [
    azure-common
    azure-storage-common
    azure-storage-nspkg
  ] ++ stdenv.lib.optional (isPy27) futures;

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Microsoft Azure Storage Blob Client Library for Python";
    homepage = https://github.com/Azure/azure-storage-python;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
