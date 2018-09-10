{ stdenv, buildPythonPackage, fetchPypi
, azure-nspkg
}:

buildPythonPackage rec {
  pname = "azure-storage-nspkg";
  version = "3.0.0";

  src = fetchPypi {
    inherit pname version;
    sha256 = "0rmlsdfnrzgvqkmbmkwwmy2gk8ap60dpw4i5h239brn07301alw5";
  };

  propagatedBuildInputs = [
    azure-nspkg
  ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Microsoft Azure Storage Namespace Package [Internal]";
    homepage = https://github.com/Azure/azure-storage-python;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
