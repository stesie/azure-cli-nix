{ stdenv, buildPythonPackage, fetchPypi
, azure-common
, azure-mgmt-nspkg
, msrestazure
}:

buildPythonPackage rec {
  pname = "azure-mgmt-resource";
  version = "2.0.0rc2";

  src = fetchPypi {
    inherit pname version;
    extension = "zip";
    sha256 = "1anh3m73ppfs12x9cngzgpkp4xqsms52iy2vyaazag9jns9j8709";
  };

  propagatedBuildInputs = [ azure-common azure-mgmt-nspkg msrestazure ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Microsoft Azure Resource Management Client Library for Python";
    homepage = https://github.com/Azure/azure-sdk-for-python;
    license = licenses.mit;
    maintainers = with maintainers; [ olcai stesie ];
  };
}
