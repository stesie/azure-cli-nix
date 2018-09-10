{ stdenv, buildPythonPackage, fetchPypi, python
, adal
, argcomplete
, azure-cli-telemetry
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
, azure-mgmt-resource
, azure-cli-nspkg
, antlr4-python3-runtime
}:

buildPythonPackage rec {
  pname = "azure-cli-core";
  version = "2.0.43";

  src = fetchPypi {
    inherit pname version;
    sha256 = "08q8gxpgs15rvwxf6dmryg9ax9ki7sy22jaqfi7g9y1rvfbnqmlq";
  };

  # Hackily force build w/ wheel 0.31
  postPatch = ''
    sed -e '/azure-namespace-package/d' -i  setup.cfg
    sed -e 's/wheel==0.30.0/wheel/' -i setup.py azure_cli_core.egg-info/requires.txt
  '';

  postFixup = ''
    rm "$out/lib/${python.libPrefix}/site-packages/azure/__init__.py"
    rm "$out/lib/${python.libPrefix}/site-packages/azure/cli/__init__.py"
  '';

  propagatedBuildInputs = [ adal argcomplete azure-cli-telemetry colorama
                            humanfriendly jmespath knack msrest msrestazure
                            paramiko pip pygments pyjwt pyopenssl pyyaml
                            requests six tabulate azure-mgmt-resource
                            azure-cli-nspkg antlr4-python3-runtime
                          ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Microsoft Azure Command-Line Tools Core Module";
    homepage = https://github.com/Azure/azure-cli;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
