{ stdenv, buildPythonPackage, fetchPypi
, mock
, msrest
}:

buildPythonPackage rec {
  pname = "vsts-cd-manager";
  version = "1.0.2";

  src = fetchPypi {
    inherit pname version;
    sha256 = "0ys4hrmjbxl4qr26qr3dhhs27yfwn1635vwjdqh1qgjmrmcr1c0b";
  };

  propagatedBuildInputs = [ mock msrest ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Microsoft Azure Command-Line Tools ACS Command Module";
    homepage = https://github.com/Azure/azure-cli;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
