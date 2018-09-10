{ stdenv, buildPythonPackage, fetchPypi
, azure-cli-command-modules-nspkg
, azure-cli-core
, azure-mgmt-reservations
}:

buildPythonPackage rec {
  pname = "azure_cli_reservations";
  version = "0.3.2";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "0mk7hvbhpsr8ykvbwzdmrfab5rl4x92r6xfzi2a78mnrjib4g4zp";
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
