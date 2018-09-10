{ stdenv, buildPythonPackage, fetchPypi, isPy27
, azure-common
, azure-storage-common
, azure-storage-nspkg
, futures
}:

buildPythonPackage rec {
  pname = "azure-storage-blob";
  version = "1.1.0";

  src = fetchPypi {
    inherit pname version;
    sha256 = "0rhwi4jwk261c7ljb1pzb4y9i2rbzhk1pznzifjrf3vdwchdrp2g";
  };

  # Fix build w/ wheel 0.31, see https://github.com/Azure/azure-storage-python/pull/443
  postPatch = ''
    sed -i azure_bdist_wheel.py \
      -e '1,483d' -e '/from wheel.bdist_wheel import bdist_wheel/ { s/^#//; }'
  '';

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
