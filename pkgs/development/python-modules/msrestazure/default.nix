{ stdenv, buildPythonPackage, fetchPypi
, adal
, msrest
}:

buildPythonPackage rec {
  pname = "msrestazure";
  version = "0.5.0";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "0q1nvwv3wi2ghpp9h4b0civfwy6w6n1h3cxh65dz18si0cyivwvk";
  };

  propagatedBuildInputs = [
    adal
    msrest
  ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "AutoRest swagger generator Python client runtime. Azure-specific module.";
    homepage = https://github.com/Azure/msrestazure-for-python;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
