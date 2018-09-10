{ stdenv, buildPythonPackage, fetchPypi }:

buildPythonPackage rec {
  pname = "portalocker";
  version = "1.2.1";

  src = fetchPypi {
    inherit pname version;
    sha256 = "17yvlk1fagd0j1qbkk0znq5hbh2kd5p36i77krjwaahfv79mcaiz";
  };

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Wraps the portalocker recipe for easy usage";
    homepage = https://github.com/WoLpH/portalocker;
    license = licenses.psfl;
    maintainers = with maintainers; [ stesie ];
  };
}

