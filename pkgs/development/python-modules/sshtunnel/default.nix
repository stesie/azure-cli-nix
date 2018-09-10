{ stdenv, buildPythonPackage, fetchPypi
, paramiko
}:

buildPythonPackage rec {
  pname = "sshtunnel";
  version = "0.1.4";

  src = fetchPypi {
    inherit pname version;
    sha256 = "0xhdqj8ych976xi847k4m7llnvlnwbn9n0iik97adbyk3cdf96pj";
  };

  propagatedBuildInputs = [ paramiko ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Pure python SSH tunnels";
    homepage = https://github.com/pahaz/sshtunnel;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
