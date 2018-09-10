{ stdenv, buildPythonPackage, fetchPypi
, azure-nspkg
}:

buildPythonPackage rec {
  pname = "azure-mgmt-nspkg";
  version = "2.0.0";

  src = fetchPypi {
    inherit pname version;
    extension = "zip";
    sha256 = "0vrycmdgqz7z0qfhakmzr5hgsj0l11pyirn3bkpnimnpypa8hr73";
  };

  propagatedBuildInputs = [ azure-nspkg ];

  meta = with stdenv.lib; {
    description = "Microsoft Azure Resource Management Namespace Package [Internal]";
    homepage = https://github.com/Azure/azure-sdk-for-python;
    license = licenses.mit;
    maintainers = with maintainers; [ olcai stesie ];
  };
}
