{ stdenv, buildPythonPackage, fetchPypi, python
, azure-cli-command-modules-nspkg
, azure-cli-core
, azure-datalake-store
, azure-mgmt-datalake-store
}:

buildPythonPackage rec {
  pname = "azure_cli_dls";
  version = "0.1.4";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "0qfcghcnvs3mnqf2iphmy49g6ljrs7b024l8wlvlm74sl4flh14a";
  };

  postFixup = ''
    rm "$out/lib/${python.libPrefix}/site-packages/azure/__init__.py"
    rm "$out/lib/${python.libPrefix}/site-packages/azure/cli/__init__.py"
    rm "$out/lib/${python.libPrefix}/site-packages/azure/cli/command_modules/__init__.py"
  '';

  propagatedBuildInputs = [
    azure-cli-command-modules-nspkg
    azure-cli-core
    azure-datalake-store
    azure-mgmt-datalake-store
  ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Microsoft Azure Command-Line Tools Data Lake Store Command Module";
    homepage = https://github.com/Azure/azure-cli;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
