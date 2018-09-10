{ stdenv, buildPythonPackage, fetchPypi
, pytest, mock, tornado, pyopenssl, cryptography
, idna, certifi, ipaddress, pysocks }:

buildPythonPackage rec {
  pname = "urllib3";
  version = "1.23";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "1d8ps62yc51c71a8bq1yx99nfmq6r0qf12bfwsq2lhmssh5mlwmm";
  };

  NOSE_EXCLUDE = stdenv.lib.concatStringsSep "," [
    "test_headers" "test_headerdict" "test_can_validate_ip_san" "test_delayed_body_read_timeout"
    "test_timeout_errors_cause_retries" "test_select_multiple_interrupts_with_event"
  ];

  checkPhase = ''
    nosetests -v --cover-min-percentage 1
  '';

  doCheck = false;

  checkInputs = [ pytest mock tornado ];
  propagatedBuildInputs = [ pyopenssl cryptography idna certifi ipaddress pysocks ];

  meta = with stdenv.lib; {
    description = "Powerful, sanity-friendly HTTP client for Python";
    homepage = https://github.com/shazow/urllib3;
    license = licenses.mit;
  };
}
