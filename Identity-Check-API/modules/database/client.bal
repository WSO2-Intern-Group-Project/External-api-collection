import ballerinax/azure_cosmosdb as cosmosdb;
import identity_check_apiss.types;

public configurable types:Config cosmosConfig = ?;

# Initialize cosmos db client
#
# + return - cosmos db client or error
public isolated function initializeDbClient() returns cosmosdb:DataPlaneClient|error {
    final cosmosdb:ConnectionConfig configuration = {
        baseUrl: cosmosConfig.baseUrl,
        primaryKeyOrResourceToken: cosmosConfig.primaryKey
    };
    return new (configuration);
}
