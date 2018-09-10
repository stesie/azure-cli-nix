{ stdenv, buildPythonPackage, fetchPypi
, azure-common
, azure-nspkg
, msrestazure
}:

buildPythonPackage rec {
  pname = "azure-batch";
  version = "4.1.3";

  src = fetchPypi {
    inherit pname version;
    extension = "zip";
    sha256 = "0k1n73qpa2ns2kjsf9rjsv4b0vcdw6dggfr5c95igaxynpmwfwfd";
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
