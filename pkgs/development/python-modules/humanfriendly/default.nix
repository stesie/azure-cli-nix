{ stdenv, buildPythonPackage, fetchPypi
, monotonic
}:

buildPythonPackage rec {
  pname = "humanfriendly";
  version = "4.16.1";

  src = fetchPypi {
    inherit pname version;
    sha256 = "0ywzfpg7b1k6s6m9yps4yfs6l7pjp4rcrp8vnhapynbb0np9h7pd";
  };

  propagatedBuildInputs = [ monotonic ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Human friendly output for text interfaces using Python";
    homepage = https://humanfriendly.readthedocs.io;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}

