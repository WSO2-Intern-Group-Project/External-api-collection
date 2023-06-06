import ballerinax/azure_cosmosdb as cosmosdb;
import identity_check_apiss.constants;
import identity_check_apiss.types;

final cosmosdb:DataPlaneClient azureCosmosClient = check initializeDbClient();
final string dbName = cosmosConfig.dbName;

public isolated function getIdentityByNIC(string nic) returns json|error {
        stream<types:Person, error?> result = check azureCosmosClient->queryDocuments(dbName, constants:IDENTITY_CONTAINER, getIdentityByNICQuery(nic));
        json[] outputs = check from types:Person person in result
            select person.toJson();
        if (outputs.length() == 1) {
            return outputs[0];
        }
        return;
}