{ stdenv, buildPythonPackage, fetchPypi
, azure-common
, azure-mgmt-nspkg
, msrestazure
}:

buildPythonPackage rec {
  pname = "azure-mgmt-trafficmanager";
  version = "0.50.0";

  src = fetchPypi {
    inherit pname version;
    extension = "zip";
    sha256 = "0ssi8sdnwqqzlzfxnar3053hfi9g57n50h1rf5dkni1bm3m6fq8j";
  };

  propagatedBuildInputs = [
    azure-common
    azure-mgmt-nspkg
    msrestazure
  ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Microsoft Azure Traffic Manager Client Library for Python";
    homepage = https://github.com/Azure/azure-sdk-for-python;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
