{ stdenv, buildPythonPackage, fetchPypi
, azure-mgmt-nspkg
}:

buildPythonPackage rec {
  pname = "azure-mgmt-datalake-nspkg";
  version = "2.0.0";

  src = fetchPypi {
    inherit pname version;
    extension = "zip";
    sha256 = "0dyac114yl4jycj0j9w9pgna0cfy9yccripr67212gms3957gf18";
  };

  propagatedBuildInputs = [ azure-mgmt-nspkg ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Microsoft Azure Data Lake Management Namespace Package [Internal]";
    homepage = https://github.com/Azure/azure-sdk-for-python;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}

