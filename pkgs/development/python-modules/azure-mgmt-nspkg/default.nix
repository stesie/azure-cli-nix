{ stdenv, buildPythonPackage, fetchPypi
, azure-nspkg
}:

buildPythonPackage rec {
  pname = "azure_mgmt_nspkg";
  version = "3.0.2";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    python = "py3";
    sha256 = "16b9s672yjlxsbw8n1wjy27ms3r0man2ksrzjkdj7lryv9gylf6n";
  };

  propagatedBuildInputs = [
    azure-nspkg
  ];

  meta = with stdenv.lib; {
    description = "Microsoft Azure Resource Management Namespace Package [Internal]";
    homepage = https://github.com/Azure/azure-sdk-for-python;
    license = licenses.mit;
    maintainers = with maintainers; [ olcai stesie ];
  };
}
