{ stdenv, buildPythonPackage, fetchPypi, isPy27, pythonOlder
, adal
, azure-nspkg
, cffi
, futures
, pathlib2
}:

buildPythonPackage rec {
  pname = "azure_datalake_store";
  version = "0.0.34";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "0k9l03wyql35irpa0vad2zgvp9l44y1xv621z6ym7y1fawp64axn";
  };

  propagatedBuildInputs = [
    adal
    azure-nspkg
    cffi
  ]
    ++ stdenv.lib.optional (isPy27) futures
    ++ stdenv.lib.optional (pythonOlder "3.4") pathlib2;

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Azure Data Lake Store Filesystem Client Library for Python";
    homepage = https://github.com/Azure/azure-data-lake-store-python;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
