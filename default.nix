self: super:

{
  python36 = super.python36.override {
    packageOverrides = python-self: python-super:

    let
      #
      # urllib3, isodate & jmespath are available from nixpkgs-unstable also, yet in
      # too old versions (or with buggy dependency metainfo).  Use compatible versions
      # for azure-cli, yet don't override/touch main package tree.
      #
      my_urllib3 = python-super.callPackage ./pkgs/development/python-modules/urllib3 {};

      my_isodate = python-super.callPackage ./pkgs/development/python-modules/isodate { };

      my_jmespath = python-super.callPackage ./pkgs/development/python-modules/jmespath { };


      #
      # get transitive dependencies right as well ....
      #
      my_requests = python-super.requests.override { urllib3 = my_urllib3; };

      my_requests_oauthlib = python-super.requests_oauthlib.override { requests = my_requests; };

      my_adal = python-super.adal.override { requests = my_requests; };

      my_argcomplete = python-super.argcomplete.override { 
        requests_toolbelt = python-super.requests_toolbelt.override { 
          requests = my_requests;
          betamax = python-super.betamax.override { requests = my_requests; };
        };
      };


    in
    
    {

      applicationinsights = python-super.callPackage ./pkgs/development/python-modules/applicationinsights {};

      azure-batch = python-super.callPackage ./pkgs/development/python-modules/azure-batch { };

      azure-cli = python-super.callPackage ./pkgs/development/python-modules/azure-cli { };

      azure-cli-acr = python-super.callPackage ./pkgs/development/python-modules/azure-cli-acr { };

      azure-cli-acs = python-super.callPackage ./pkgs/development/python-modules/azure-cli-acs { };

      azure-cli-advisor = python-super.callPackage ./pkgs/development/python-modules/azure-cli-advisor { };

      azure-cli-ams = python-super.callPackage ./pkgs/development/python-modules/azure-cli-ams { };

      azure-cli-appservice = python-super.callPackage ./pkgs/development/python-modules/azure-cli-appservice {
        urllib3 = my_urllib3;
      };

      azure-cli-backup = python-super.callPackage ./pkgs/development/python-modules/azure-cli-backup { };

      azure-cli-batch = python-super.callPackage ./pkgs/development/python-modules/azure-cli-batch { };

      azure-cli-batchai = python-super.callPackage ./pkgs/development/python-modules/azure-cli-batchai { };

      azure-cli-billing = python-super.callPackage ./pkgs/development/python-modules/azure-cli-billing { };

      azure-cli-botservice = python-super.callPackage ./pkgs/development/python-modules/azure-cli-botservice { };

      azure-cli-cdn = python-super.callPackage ./pkgs/development/python-modules/azure-cli-cdn { };

      azure-cli-cloud = python-super.callPackage ./pkgs/development/python-modules/azure-cli-cloud { };

      azure-cli-cognitiveservices = python-super.callPackage ./pkgs/development/python-modules/azure-cli-cognitiveservices { };

      azure-cli-command-modules-nspkg = python-super.callPackage ./pkgs/development/python-modules/azure-cli-command-modules-nspkg { };

      azure-cli-configure = python-super.callPackage ./pkgs/development/python-modules/azure-cli-configure { };

      azure-cli-consumption = python-super.callPackage ./pkgs/development/python-modules/azure-cli-consumption { };

      azure-cli-container = python-super.callPackage ./pkgs/development/python-modules/azure-cli-container { };

      azure-cli-core = python-super.callPackage ./pkgs/development/python-modules/azure-cli-core {
        adal = my_adal;
        argcomplete = my_argcomplete;
        jmespath = my_jmespath;
        requests = my_requests;
      };

      azure-cli-cosmosdb = python-super.callPackage ./pkgs/development/python-modules/azure-cli-cosmosdb { };

      azure-cli-dla = python-super.callPackage ./pkgs/development/python-modules/azure-cli-dla { };

      azure-cli-dls = python-super.callPackage ./pkgs/development/python-modules/azure-cli-dls { };

      azure-cli-dms = python-super.callPackage ./pkgs/development/python-modules/azure-cli-dms { };

      azure-cli-eventgrid = python-super.callPackage ./pkgs/development/python-modules/azure-cli-eventgrid { };

      azure-cli-eventhubs = python-super.callPackage ./pkgs/development/python-modules/azure-cli-eventhubs { };

      azure-cli-extension = python-super.callPackage ./pkgs/development/python-modules/azure-cli-extension { };

      azure-cli-feedback = python-super.callPackage ./pkgs/development/python-modules/azure-cli-feedback { };

      azure-cli-find = python-super.callPackage ./pkgs/development/python-modules/azure-cli-find { };

      azure-cli-hdinsight = python-super.callPackage ./pkgs/development/python-modules/azure-cli-hdinsight { };

      azure-cli-interactive = python-super.callPackage ./pkgs/development/python-modules/azure-cli-interactive {
        jmespath = my_jmespath;
      };

      azure-cli-iot = python-super.callPackage ./pkgs/development/python-modules/azure-cli-iot { };

      azure-cli-iotcentral = python-super.callPackage ./pkgs/development/python-modules/azure-cli-iotcentral { };

      azure-cli-keyvault = python-super.callPackage ./pkgs/development/python-modules/azure-cli-keyvault { };

      azure-cli-lab = python-super.callPackage ./pkgs/development/python-modules/azure-cli-lab { };

      azure-cli-maps = python-super.callPackage ./pkgs/development/python-modules/azure-cli-maps { };

      azure-cli-monitor = python-super.callPackage ./pkgs/development/python-modules/azure-cli-monitor { };

      azure-cli-network = python-super.callPackage ./pkgs/development/python-modules/azure-cli-network { };

      azure-cli-nspkg = python-super.callPackage ./pkgs/development/python-modules/azure-cli-nspkg { };

      azure-cli-policyinsights = python-super.callPackage ./pkgs/development/python-modules/azure-cli-policyinsights { };

      azure-cli-profile = python-super.callPackage ./pkgs/development/python-modules/azure-cli-profile { };

      azure-cli-rdbms = python-super.callPackage ./pkgs/development/python-modules/azure-cli-rdbms { };

      azure-cli-redis = python-super.callPackage ./pkgs/development/python-modules/azure-cli-redis { };

      azure-cli-relay = python-super.callPackage ./pkgs/development/python-modules/azure-cli-relay { };

      azure-cli-reservations = python-super.callPackage ./pkgs/development/python-modules/azure-cli-reservations { };

      azure-cli-resource = python-super.callPackage ./pkgs/development/python-modules/azure-cli-resource { };

      azure-cli-role = python-super.callPackage ./pkgs/development/python-modules/azure-cli-role { };

      azure-cli-search = python-super.callPackage ./pkgs/development/python-modules/azure-cli-search { };

      azure-cli-servicebus = python-super.callPackage ./pkgs/development/python-modules/azure-cli-servicebus { };

      azure-cli-servicefabric = python-super.callPackage ./pkgs/development/python-modules/azure-cli-servicefabric { };

      azure-cli-signalr = python-super.callPackage ./pkgs/development/python-modules/azure-cli-signalr { };

      azure-cli-sql = python-super.callPackage ./pkgs/development/python-modules/azure-cli-sql { };

      azure-cli-storage = python-super.callPackage ./pkgs/development/python-modules/azure-cli-storage { };

      azure-cli-telemetry = python-super.callPackage ./pkgs/development/python-modules/azure-cli-telemetry { };

      azure-cli-vm = python-super.callPackage ./pkgs/development/python-modules/azure-cli-vm { };

      azure-common = python-super.callPackage ./pkgs/development/python-modules/azure-common { };

      azure-datalake-store = python-super.callPackage ./pkgs/development/python-modules/azure-datalake-store {
        adal = my_adal;
      };

      azure-graphrbac = python-super.callPackage ./pkgs/development/python-modules/azure-graphrbac { };

      azure-keyvault = python-super.callPackage ./pkgs/development/python-modules/azure-keyvault {
        requests = my_requests;
      };

      azure-mgmt-advisor = python-super.callPackage ./pkgs/development/python-modules/azure-mgmt-advisor { };

      azure-mgmt-authorization = python-super.callPackage ./pkgs/development/python-modules/azure-mgmt-authorization { };

      azure-mgmt-batch = python-super.callPackage ./pkgs/development/python-modules/azure-mgmt-batch { };

      azure-mgmt-batchai = python-super.callPackage ./pkgs/development/python-modules/azure-mgmt-batchai { };

      azure-mgmt-billing = python-super.callPackage ./pkgs/development/python-modules/azure-mgmt-billing { };

      azure-mgmt-botservice = python-super.callPackage ./pkgs/development/python-modules/azure-mgmt-botservice { };

      azure-mgmt-cdn = python-super.callPackage ./pkgs/development/python-modules/azure-mgmt-cdn { };

      azure-mgmt-cognitiveservices = python-super.callPackage ./pkgs/development/python-modules/azure-mgmt-cognitiveservices { };

      azure-mgmt-compute = python-super.callPackage ./pkgs/development/python-modules/azure-mgmt-compute { };

      azure-mgmt-consumption = python-super.callPackage ./pkgs/development/python-modules/azure-mgmt-consumption { };

      azure-mgmt-containerinstance = python-super.callPackage ./pkgs/development/python-modules/azure-mgmt-containerinstance { };

      azure-mgmt-containerregistry = python-super.callPackage ./pkgs/development/python-modules/azure-mgmt-containerregistry { };

      azure-mgmt-containerservice = python-super.callPackage ./pkgs/development/python-modules/azure-mgmt-containerservice { };

      azure-mgmt-cosmosdb = python-super.callPackage ./pkgs/development/python-modules/azure-mgmt-cosmosdb { };

      azure-mgmt-datalake-analytics = python-super.callPackage ./pkgs/development/python-modules/azure-mgmt-datalake-analytics { };

      azure-mgmt-datalake-nspkg = python-super.callPackage ./pkgs/development/python-modules/azure-mgmt-datalake-nspkg { };

      azure-mgmt-datalake-store = python-super.callPackage ./pkgs/development/python-modules/azure-mgmt-datalake-store { };

      azure-mgmt-datamigration = python-super.callPackage ./pkgs/development/python-modules/azure-mgmt-datamigration { };

      azure-mgmt-devtestlabs = python-super.callPackage ./pkgs/development/python-modules/azure-mgmt-devtestlabs { };

      azure-mgmt-dns = python-super.callPackage ./pkgs/development/python-modules/azure-mgmt-dns { };

      azure-mgmt-eventgrid = python-super.callPackage ./pkgs/development/python-modules/azure-mgmt-eventgrid { };

      azure-mgmt-eventhub = python-super.callPackage ./pkgs/development/python-modules/azure-mgmt-eventhub { };

      azure-mgmt-hdinsight = python-super.callPackage ./pkgs/development/python-modules/azure-mgmt-hdinsight { };

      azure-mgmt-iotcentral = python-super.callPackage ./pkgs/development/python-modules/azure-mgmt-iotcentral { };

      azure-mgmt-iothub = python-super.callPackage ./pkgs/development/python-modules/azure-mgmt-iothub { };

      azure-mgmt-iothubprovisioningservices = python-super.callPackage ./pkgs/development/python-modules/azure-mgmt-iothubprovisioningservices { };

      azure-mgmt-keyvault = python-super.callPackage ./pkgs/development/python-modules/azure-mgmt-keyvault { };

      azure-mgmt-loganalytics = python-super.callPackage ./pkgs/development/python-modules/azure-mgmt-loganalytics { };

      azure-mgmt-managementgroups = python-super.callPackage ./pkgs/development/python-modules/azure-mgmt-managementgroups { };

      azure-mgmt-maps = python-super.callPackage ./pkgs/development/python-modules/azure-mgmt-maps { };

      azure-mgmt-marketplaceordering = python-super.callPackage ./pkgs/development/python-modules/azure-mgmt-marketplaceordering { };

      azure-mgmt-media = python-super.callPackage ./pkgs/development/python-modules/azure-mgmt-media { };

      azure-mgmt-monitor = python-super.callPackage ./pkgs/development/python-modules/azure-mgmt-monitor { };

      azure-mgmt-msi = python-super.callPackage ./pkgs/development/python-modules/azure-mgmt-msi { };

      azure-mgmt-network = python-super.callPackage ./pkgs/development/python-modules/azure-mgmt-network { };

      azure-mgmt-nspkg = python-super.callPackage ./pkgs/development/python-modules/azure-mgmt-nspkg { };

      azure-mgmt-policyinsights = python-super.callPackage ./pkgs/development/python-modules/azure-mgmt-policyinsights { };

      azure-mgmt-rdbms = python-super.callPackage ./pkgs/development/python-modules/azure-mgmt-rdbms { };

      azure-mgmt-recoveryservices = python-super.callPackage ./pkgs/development/python-modules/azure-mgmt-recoveryservices { };

      azure-mgmt-recoveryservicesbackup = python-super.callPackage ./pkgs/development/python-modules/azure-mgmt-recoveryservicesbackup { };

      azure-mgmt-redis = python-super.callPackage ./pkgs/development/python-modules/azure-mgmt-redis { };

      azure-mgmt-relay = python-super.callPackage ./pkgs/development/python-modules/azure-mgmt-relay { };

      azure-mgmt-reservations = python-super.callPackage ./pkgs/development/python-modules/azure-mgmt-reservations { };

      azure-mgmt-resource = python-super.callPackage ./pkgs/development/python-modules/azure-mgmt-resource { };

      azure-mgmt-search = python-super.callPackage ./pkgs/development/python-modules/azure-mgmt-search { };

      azure-mgmt-servicebus = python-super.callPackage ./pkgs/development/python-modules/azure-mgmt-servicebus { };

      azure-mgmt-servicefabric = python-super.callPackage ./pkgs/development/python-modules/azure-mgmt-servicefabric { };

      azure-mgmt-signalr = python-super.callPackage ./pkgs/development/python-modules/azure-mgmt-signalr { };

      azure-mgmt-sql = python-super.callPackage ./pkgs/development/python-modules/azure-mgmt-sql { };

      azure-mgmt-storage = python-super.callPackage ./pkgs/development/python-modules/azure-mgmt-storage { };

      azure-mgmt-trafficmanager = python-super.callPackage ./pkgs/development/python-modules/azure-mgmt-trafficmanager { };

      azure-mgmt-web = python-super.callPackage ./pkgs/development/python-modules/azure-mgmt-web { };

      azure-multiapi-storage = python-super.callPackage ./pkgs/development/python-modules/azure-multiapi-storage {
        requests = my_requests;
      };

      azure-nspkg = python-super.callPackage ./pkgs/development/python-modules/azure-nspkg { };

      azure-storage-blob = python-super.callPackage ./pkgs/development/python-modules/azure-storage-blob { };

      azure-storage-common = python-super.callPackage ./pkgs/development/python-modules/azure-storage-common {
        requests = my_requests;
      };

      azure-storage-nspkg = python-super.callPackage ./pkgs/development/python-modules/azure-storage-nspkg { };

      humanfriendly = python-super.callPackage ./pkgs/development/python-modules/humanfriendly {};

      knack = python-super.callPackage ./pkgs/development/python-modules/knack {
        argcomplete = my_argcomplete;
        jmespath = my_jmespath;

      };

      msrest = python-super.callPackage ./pkgs/development/python-modules/msrest {
        isodate = my_isodate;
        requests = my_requests;
        requests_oauthlib = my_requests_oauthlib;
      };

      msrestazure = python-super.callPackage ./pkgs/development/python-modules/msrestazure {
        adal = my_adal;
      };

      portalocker = python-super.callPackage ./pkgs/development/python-modules/portalocker { };

      pydocumentdb = python-super.callPackage ./pkgs/development/python-modules/pydocumentdb {
        requests = my_requests;
      };

      sshtunnel = python-super.callPackage ./pkgs/development/python-modules/sshtunnel { };

      vsts-cd-manager = python-super.callPackage ./pkgs/development/python-modules/vsts-cd-manager { };

    };
  };

}

