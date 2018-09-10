{ stdenv, buildPythonPackage, fetchPypi
, azure-common
, azure-mgmt-datalake-nspkg
, msrestazure
}:

buildPythonPackage rec {
  pname = "azure-mgmt-datalake-store";
  version = "0.2.0";

  src = fetchPypi {
    inherit pname version;
    extension = "zip";
    sha256 = "1m0vn2mw5limh91a23n7s21mw568snb0lbqcsh94p0q0ivlwpp90";
  };

  # Fix build w/ wheel 0.31, see https://github.com/Azure/azure-storage-python/pull/443
  postPatch = ''
    sed -i azure_bdist_wheel.py \
      -e '1,483d' -e '/from wheel.bdist_wheel import bdist_wheel/ { s/^#//; }'
  '';

  propagatedBuildInputs = [
    azure-common
    azure-mgmt-datalake-nspkg
    msrestazure
  ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Microsoft Azure Data Lake Store Management Client Library for Python";
    homepage = https://github.com/Azure/azure-sdk-for-python;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
