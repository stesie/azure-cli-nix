{ stdenv, buildPythonPackage, fetchPypi
, monotonic
}:

buildPythonPackage rec {
  pname = "humanfriendly";
  version = "4.16.1";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "0qs3ck0zn98cnmafnwrby7r8qbj5d3jdrwkb4l3339s1pjp6l6a9";
  };

  propagatedBuildInputs = [
    monotonic
  ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Human friendly output for text interfaces using Python";
    homepage = https://humanfriendly.readthedocs.io;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}

