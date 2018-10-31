{ stdenv, buildPythonPackage, fetchPypi
, azure-mgmt-nspkg
}:

buildPythonPackage rec {
  pname = "azure_mgmt_datalake_nspkg";
  version = "3.0.1";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    python = "py3";
    sha256 = "1i123farkcrr7nmk9b24bznypvwc16ih7yy5k4hi31svql9zmiia";
  };

  propagatedBuildInputs = [
    azure-mgmt-nspkg
  ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Microsoft Azure Data Lake Management Namespace Package [Internal]";
    homepage = https://github.com/Azure/azure-sdk-for-python;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}

