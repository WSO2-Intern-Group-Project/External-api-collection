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

# Type related to address container in cosmos db
#
# + NIC - Nic of the uesr
# + name - name of the user
# + address - address of the user
public type AddressReport record {|
    string NIC;
    string name;
    string address;
|};
