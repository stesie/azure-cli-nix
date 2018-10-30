{ stdenv, buildPythonPackage, fetchPypi
, azure-cli-command-modules-nspkg
, azure-cli-core
, azure-mgmt-cognitiveservices
}:

buildPythonPackage rec {
  pname = "azure_cli_cognitiveservices";
  version = "0.2.3";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "1k171z887dny6g4ypgklwxn5lgv4qgv5n3pg57mchxgsmy74p5sn";
  };

  propagatedBuildInputs = [
    azure-cli-command-modules-nspkg
    azure-cli-core
    azure-mgmt-cognitiveservices
  ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Microsoft Azure Command-Line Tools Cognitive Services Command Module";
    homepage = https://github.com/azure/azure-cli;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
