import ballerinax/azure_cosmosdb as cosmosdb;
import police_check_api.constants;
import police_check_api.types;

final cosmosdb:DataPlaneClient azureCosmosClient = check initializeDbClient();
final string dbName = cosmosConfig.dbName;

# Get police reports by nic
#
# + nic - user nic
# + return - requests json array or error

public isolated function getPoliceReportsByNIC(string nic) returns json[]|error {
        stream<types:PoliceReport, error?> result = check azureCosmosClient->queryDocuments(dbName, constants:POLICE_REPORT_CONTAINER, getPoliceReportsByNICQuery(nic));
        return from types:PoliceReport policeReport in result
            select policeReport.toJson();
}