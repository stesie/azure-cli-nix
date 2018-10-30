{ stdenv, buildPythonPackage, fetchPypi
}:

buildPythonPackage rec {
  pname = "applicationinsights";
  version = "0.11.7";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "1zhrl8bpwga4l906k83m9yrx4rh15hnmppvg4kcgs7ymz82yp8j2";
  };

  propagatedBuildInputs = [
  ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "This project extends the Application Insights API surface to support Python.";
    homepage = https://github.com/Microsoft/ApplicationInsights-Python;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
