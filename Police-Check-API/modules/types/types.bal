# Configuration values 
#
# + baseUrl - cosmos db url  
# + primaryKey - key of the cosmos db 
# + dbName - cosmos db name
public type Config record {
    string baseUrl;
    string primaryKey;
    string dbName;
};

# Type related to Police report container in cosmos db
#
# + NIC - Nic of the uesr
# + date - date of the police report
# + description - description of the police report
public type PoliceReport record {|
    string NIC;
    string date;
    string description;
|};
