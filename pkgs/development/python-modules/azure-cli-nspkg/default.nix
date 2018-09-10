{ stdenv, buildPythonPackage, fetchPypi, azure-nspkg }:

buildPythonPackage rec {
  pname = "azure-cli-nspkg";
  version = "3.0.3";

  src = fetchPypi {
    inherit pname version;
    sha256 = "0f92mzbknc9l26b4f5f3m943a44q4qz1xjq2klnrmixrnnax2cqp";
  };

  propagatedBuildInputs = [ azure-nspkg ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Microsoft Azure CLI Namespace Package";
    homepage = https://github.com/Azure/azure-cli;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
