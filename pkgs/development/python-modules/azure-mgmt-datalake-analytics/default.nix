{ stdenv, buildPythonPackage, fetchPypi
, azure-common
, azure-mgmt-datalake-nspkg
, msrestazure
}:

buildPythonPackage rec {
  pname = "azure-mgmt-datalake-analytics";
  version = "0.2.0";

  src = fetchPypi {
    inherit pname version;
    extension = "zip";
    sha256 = "0w02j14kyvgrq3qwhnz2wrqjjjzr13vpcs1yazcpwgaqwa5h1srd";
  };

  propagatedBuildInputs = [
    azure-common
    azure-mgmt-datalake-nspkg
    msrestazure
  ];

  patches = [
    ./msrestazure-version.patch
  ];

  # Fix build w/ wheel 0.31, see https://github.com/Azure/azure-storage-python/pull/443
  postPatch = ''
    sed -i azure_bdist_wheel.py \
      -e '1,483d' -e '/from wheel.bdist_wheel import bdist_wheel/ { s/^#//; }'
  '';

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Microsoft Azure Data Lake Analytics Management Client Library for Python";
    homepage = https://github.com/Azure/azure-sdk-for-python;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
