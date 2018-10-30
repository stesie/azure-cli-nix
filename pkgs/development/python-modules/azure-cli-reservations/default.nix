{ stdenv, buildPythonPackage, fetchPypi
, azure-cli-command-modules-nspkg
, azure-cli-core
, azure-mgmt-reservations
}:

buildPythonPackage rec {
  pname = "azure_cli_reservations";
  version = "0.4.0";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "1vgm1b68vzxgf7a5vyn4gv9zrq0wkbhjj4dw5ss4wnxpwhii542x";
  };

  propagatedBuildInputs = [
    azure-cli-command-modules-nspkg
    azure-cli-core
    azure-mgmt-reservations
  ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Microsoft Azure Command-Line Tools Reservations Command Module";
    homepage = https://github.com/azure/azure-cli;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
