{ stdenv, buildPythonPackage, fetchPypi
, azure-cli-nspkg
}:

buildPythonPackage rec {
  pname = "azure-cli-command-modules-nspkg";
  version = "2.0.2";

  src = fetchPypi {
    inherit pname version;
    sha256 = "11lhrrn0l5kjq848mlm210i3hj43a4ii84xi6jbq00z46sv5xy53";
  };

  propagatedBuildInputs = [
    azure-cli-nspkg
  ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Microsoft Azure CLI Command Modules Namespace Package";
    homepage = https://github.com/Azure/azure-cli;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
