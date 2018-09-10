{ stdenv, buildPythonPackage, fetchPypi }:

buildPythonPackage rec {
  pname = "applicationinsights";
  version = "0.11.6";

  src = fetchPypi {
    inherit pname version;
    sha256 = "0b5abcdxbakqxsha6427qjwgvgh7j8p57apw495rvzm6hcv9d302";
  };

  doCheck = false;

  meta = with stdenv.lib; {
    description = "This project extends the Application Insights API surface to support Python.";
    homepage = https://github.com/Microsoft/ApplicationInsights-Python;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
