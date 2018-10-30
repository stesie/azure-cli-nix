{ stdenv, buildPythonPackage, fetchPypi
, azure-common
, azure-mgmt-nspkg
, msrestazure
}:

buildPythonPackage rec {
  pname = "azure_mgmt_cognitiveservices";
  version = "3.0.0";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "1zzqydlbcp63wha0q4k005mp475c4gc9qc4r98acslk69gp0dd1n";
  };

  propagatedBuildInputs = [
    azure-common
    azure-mgmt-nspkg
    msrestazure
  ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Microsoft Azure Cognitive Services Management Client Library for Python";
    homepage = https://github.com/Azure/azure-sdk-for-python;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
