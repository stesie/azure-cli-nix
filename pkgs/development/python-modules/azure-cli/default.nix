{ stdenv, buildPythonPackage, fetchPypi, python
, azure-cli-acr
, azure-cli-acs
, azure-cli-advisor
, azure-cli-ams
, azure-cli-appservice
, azure-cli-backup
, azure-cli-batch
, azure-cli-batchai
, azure-cli-billing
, azure-cli-cdn
, azure-cli-cloud
, azure-cli-cognitiveservices
, azure-cli-configure
, azure-cli-consumption
, azure-cli-container
, azure-cli-core
, azure-cli-cosmosdb
, azure-cli-dla
, azure-cli-dls
, azure-cli-dms
, azure-cli-eventgrid
, azure-cli-eventhubs
, azure-cli-extension
, azure-cli-feedback
, azure-cli-find
, azure-cli-interactive
, azure-cli-iot
, azure-cli-keyvault
, azure-cli-lab
, azure-cli-monitor
, azure-cli-network
, azure-cli-nspkg
, azure-cli-profile
, azure-cli-rdbms
, azure-cli-redis
, azure-cli-reservations
, azure-cli-resource
, azure-cli-role
, azure-cli-search
, azure-cli-servicebus
, azure-cli-servicefabric
, azure-cli-sql
, azure-cli-storage
, azure-cli-vm
}:

buildPythonPackage rec {
  pname = "azure_cli";
  version = "2.0.45";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    sha256 = "053mmnghgljy4v7csyah5gvf88bg6s8xzw9dsj4zcpp332v43qhn";
  };

  propagatedBuildInputs = [
    azure-cli-acr
    azure-cli-acs
    azure-cli-advisor
    azure-cli-ams
    azure-cli-appservice
    azure-cli-batch
    azure-cli-batchai
    azure-cli-backup
    azure-cli-billing
    azure-cli-cdn
    azure-cli-cloud
    azure-cli-cognitiveservices
    azure-cli-container
    azure-cli-configure
    azure-cli-consumption
    azure-cli-core
    azure-cli-cosmosdb
    azure-cli-dla
    azure-cli-dls
    azure-cli-dms
    azure-cli-eventgrid
    azure-cli-extension
    azure-cli-feedback
    azure-cli-find
    azure-cli-interactive
    azure-cli-iot
    azure-cli-keyvault
    azure-cli-lab
    azure-cli-monitor
    azure-cli-network
    azure-cli-nspkg
    azure-cli-profile
    azure-cli-rdbms
    azure-cli-redis
    azure-cli-reservations
    azure-cli-resource
    azure-cli-role
    azure-cli-sql
    azure-cli-storage
    azure-cli-vm
    azure-cli-servicefabric
    azure-cli-servicebus
    azure-cli-eventhubs
    azure-cli-search
  ];

  # filter azure-xxx-nspkg packages from $program_PYTHONPATH and wrap invoker script setting it
  postFixup = ''
    IFS=: read -r -d "" -a path_array < <(printf '%s:\0' "$program_PYTHONPATH")
    filteredPythonPath=""

    for p in ''${path_array[@]}; do
      if [[ ! "$p" =~ "-nspkg-" ]]; then
        filteredPythonPath="$filteredPythonPath"''${filteredPythonPath:+':'}"$p"
      fi
    done

    wrapProgram $out/bin/az --set PYTHONPATH "$filteredPythonPath" --prefix PATH ":" ${python}/bin
  '';

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Microsoft Azure Command-Line Tools";
    homepage = https://github.com/Azure/azure-cli;
    license = licenses.mit;
    maintainers = with maintainers; [ stesie ];
  };
}
