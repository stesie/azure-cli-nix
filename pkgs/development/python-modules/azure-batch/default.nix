{ stdenv, buildPythonPackage, fetchPypi
, azure-common
, azure-nspkg
, msrestazure
}:

buildPythonPackage rec {
  pname = "azure_batch";
  version = "5.1.0";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "0vm7l4kqg65byllqrrgvnpcxariis1qagc2cfxmh2yjbyy0g647w";
  };

  propagatedBuildInputs = [
    azure-common
    azure-nspkg
    msrestazure
  ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Microsoft Azure Batch Client Library for Python";
    homepage = https://github.com/Azure/azure-sdk-for-python;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
