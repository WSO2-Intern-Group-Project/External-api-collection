import ballerinax/azure_cosmosdb as cosmosdb;
import address_check_api.constants;
import address_check_api.types;

final cosmosdb:DataPlaneClient azureCosmosClient = check initializeDbClient();
final string dbName = cosmosConfig.dbName;

public isolated function getResidentsByAddress(string address) returns json[]|error {
        stream<types:AddressReport, error?> result = check azureCosmosClient->queryDocuments(dbName, constants:ADDRESS_CONTAINER, getResidentsByAddressQuery(address));
        return from types:AddressReport addressReport in result
            select addressReport.toJson();
}