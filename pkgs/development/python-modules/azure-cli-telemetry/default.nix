{ stdenv, buildPythonPackage, fetchPypi
, applicationinsights, azure-cli-nspkg, portalocker }:

buildPythonPackage rec {
  pname = "azure_cli_telemetry";
  version = "1.0.0";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "0dc5yg28szg5pw4k0ybk95al2n50zfcgsmvq15s8hwvcvgv2xw3s";
  };

  propagatedBuildInputs = [ applicationinsights azure-cli-nspkg portalocker ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Microsoft Azure CLI Telemetry Package";
    homepage = https://github.com/Azure/azure-cli;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
