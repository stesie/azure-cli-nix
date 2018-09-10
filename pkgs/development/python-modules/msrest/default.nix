{ stdenv, buildPythonPackage, fetchPypi
, requests
, requests_oauthlib
, isodate
, certifi
}:

buildPythonPackage rec {
  pname = "msrest";
  version = "0.4.29";

  src = fetchPypi {
    inherit pname version;
    sha256 = "0ifbcihdwd5rpd92r9by6s4imj422crj8vn6gpwbzixpff0ma2nf";
  };

  # TODO (stesie): dependencies for python < 3.5
  # Requires-Dist: enum34 (>=1.0.4); python_version<'3.4'
  # Requires-Dist: typing; python_version<'3.5'
  propagatedBuildInputs = [ requests requests_oauthlib isodate certifi ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "AutoRest swagger generator Python client runtime.";
    homepage = https://github.com/Azure/msrest-for-python;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}

