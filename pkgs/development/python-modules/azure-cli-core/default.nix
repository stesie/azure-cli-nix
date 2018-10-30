{ stdenv, buildPythonPackage, fetchPypi, python
, adal
, antlr4-python3-runtime
, argcomplete
, azure-cli-nspkg
, azure-cli-telemetry
, azure-mgmt-resource
, colorama
, humanfriendly
, jmespath
, knack
, msrest
, msrestazure
, paramiko
, pip
, pygments
, pyjwt
, pyopenssl
, pyyaml
, requests
, six
, tabulate
}:

buildPythonPackage rec {
  pname = "azure_cli_core";
  version = "2.0.49";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "1jrbvhqilwkiaqkcp3r2g358mrsjq4hiym522ijcx4dskrvxgdg1";
  };

  postFixup = ''
    rm "$out/lib/${python.libPrefix}/site-packages/azure/__init__.py"
    rm "$out/lib/${python.libPrefix}/site-packages/azure/cli/__init__.py"
  '';

  propagatedBuildInputs = [
    adal
    antlr4-python3-runtime
    argcomplete
    azure-cli-nspkg
    azure-cli-telemetry
    azure-mgmt-resource
    colorama
    humanfriendly
    jmespath
    knack
    msrest
    msrestazure
    paramiko
    pip
    pygments
    pyjwt
    pyopenssl
    pyyaml
    requests
    six
    tabulate
  ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Microsoft Azure Command-Line Tools Core Module";
    homepage = https://github.com/Azure/azure-cli;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
