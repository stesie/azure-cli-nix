{ stdenv, buildPythonPackage, fetchPypi }:

buildPythonPackage rec {
  pname = "azure-nspkg";
  version = "2.0.0";

  src = fetchPypi {
    inherit pname version;
    extension = "zip";
    sha256 = "0yyw3wcy7xkrxwg7150a1wivgzwwyl877z2p4pv8xvk6iifyw6gy";
  };

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Microsoft Azure Namespace Package";
    homepage = https://github.com/Azure/azure-sdk-for-python;
    license = licenses.mit;
    maintainers = with maintainers; [ olcai stesie ];
  };
}
