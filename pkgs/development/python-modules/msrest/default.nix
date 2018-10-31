{ stdenv, buildPythonPackage, fetchPypi
, aiodns
, aiohttp
, certifi
, isodate
, requests
, requests_oauthlib
}:

buildPythonPackage rec {
  pname = "msrest";
  version = "0.6.1";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "06gfy360plqbzhxni2d7xvn0cv9k15bjvfq3ismk04l2wh095xqm";
  };

  # TODO (stesie): dependencies for python < 3.5
  # Requires-Dist: enum34 (>=1.0.4); python_version<'3.4'
  # Requires-Dist: typing; python_version<'3.5'
  propagatedBuildInputs = [
    aiodns
    aiohttp
    certifi
    isodate
    requests
    requests_oauthlib
  ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "AutoRest swagger generator Python client runtime.";
    homepage = https://github.com/Azure/msrest-for-python;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}

