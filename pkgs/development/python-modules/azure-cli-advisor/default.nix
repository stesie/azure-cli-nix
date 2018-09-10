{ stdenv, buildPythonPackage, fetchPypi
, azure-cli-command-modules-nspkg
, azure-cli-core
, azure-mgmt-advisor
}:

buildPythonPackage rec {
  pname = "azure_cli_advisor";
  version = "0.6.0";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "1awja7di1gdw32jr0q6srijk2msk60g5aqyy4jaancb3vbqv8r26";
  };

  propagatedBuildInputs = [
    azure-cli-command-modules-nspkg
    azure-cli-core
    azure-mgmt-advisor
  ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Microsoft Azure Command-Line Tools Advisor Command Module";
    homepage = https://github.com/Azure/azure-cli;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
