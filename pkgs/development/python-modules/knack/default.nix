{ stdenv, buildPythonPackage, fetchPypi
, argcomplete
, colorama
, jmespath
, pygments
, pyyaml
, six
, tabulate
}:

buildPythonPackage rec {
  pname = "knack";
  version = "0.4.1";

  src = fetchPypi {
    inherit pname version;
    sha256 = "182rp3y6y8b0lbsrpi9k5qvg9q7p1qffqp79sv9izygsq9lzsids";
  };

  # TODO (stesie): dependency enum34 for python < 3.4
  propagatedBuildInputs = [ argcomplete colorama jmespath pygments pyyaml
                            six tabulate ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "A Command-Line Interface framework";
    homepage = https://github.com/microsoft/knack;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}

