{ stdenv, buildPythonPackage, fetchPypi, python
, azure-cli-command-modules-nspkg
, azure-cli-core
, azure-graphrbac
, azure-keyvault
, azure-mgmt-compute
, azure-mgmt-keyvault
, azure-mgmt-network
, azure-mgmt-servicefabric
, azure-mgmt-storage
, pyopenssl
}:

buildPythonPackage rec {
  pname = "azure_cli_servicefabric";
  version = "0.1.6";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "0vw7nmg99q2nll1afc9spsw9ry64xrnqsikql3b2rcjmh919mvjv";
  };

  postFixup = ''
    rm "$out/lib/${python.libPrefix}/site-packages/azure/__init__.py"
    rm "$out/lib/${python.libPrefix}/site-packages/azure/cli/__init__.py"
    rm "$out/lib/${python.libPrefix}/site-packages/azure/cli/command_modules/__init__.py"
  '';

  propagatedBuildInputs = [
    azure-cli-command-modules-nspkg
    azure-cli-core
    azure-graphrbac
    azure-keyvault
    azure-mgmt-compute
    azure-mgmt-keyvault
    azure-mgmt-network
    azure-mgmt-servicefabric
    azure-mgmt-storage
    pyopenssl
  ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Microsoft Azure Service Fabric Command-Line Tools";
    homepage = https://github.com/Azure/azure-cli;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
