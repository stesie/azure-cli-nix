{ stdenv, buildPythonPackage, fetchPypi, python
, azure-batch
, azure-cli-command-modules-nspkg
, azure-cli-core
, azure-mgmt-batch
, azure-mgmt-keyvault
}:

buildPythonPackage rec {
  pname = "azure_cli_batch";
  version = "3.4.1";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "19z76ik99vl6i20jvad8mys5jhrcy181kqw18lwnmp8945ir1lfk";
  };

  postFixup = ''
    rm "$out/lib/${python.libPrefix}/site-packages/azure/__init__.py"
    rm "$out/lib/${python.libPrefix}/site-packages/azure/cli/__init__.py"
    rm "$out/lib/${python.libPrefix}/site-packages/azure/cli/command_modules/__init__.py"
  '';

  propagatedBuildInputs = [
    azure-batch
    azure-cli-command-modules-nspkg
    azure-cli-core
    azure-mgmt-batch
    azure-mgmt-keyvault
  ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Microsoft Azure Command-Line Tools Batch Command Module";
    homepage = https://github.com/Azure/azure-cli;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
