{ stdenv, buildPythonPackage, fetchPypi
, azure-common
, azure-mgmt-nspkg
, msrestazure
}:

buildPythonPackage rec {
  pname = "azure-mgmt-managementgroups";
  version = "0.1.0";

  src = fetchPypi {
    inherit pname version;
    extension = "zip";
    sha256 = "1is7pn1qq7ipmpkya6dlmjjp55bs6rdd3c8c2qv4lqysxn1djqpz";
  };

  propagatedBuildInputs = [
    azure-common
    azure-mgmt-nspkg
    msrestazure
  ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Microsoft Azure Management Groups Client Library for Python";
    homepage = https://github.com/Azure/azure-sdk-for-python;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
