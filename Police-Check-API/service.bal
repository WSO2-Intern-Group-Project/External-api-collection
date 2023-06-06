import ballerina/http;
import identity_check_api.database;
import identity_check_api.types;
import identity_check_api.constants;

service / on new http:Listener(9090) {

    # Get police records by user nic
    #
    # + nic - User nic
    # + return - Json array of police records under the user nic
    isolated resource function get policeRecordsByNIC(string nic) returns json[]|types:AppServerError {
        json[]|error  outputs = database:getPoliceReportsByNIC(nic);
        if outputs is error {
            return <types:AppServerError>{
                body: {message: constants:INTERNAL_ERROR}
            };
        }
        return outputs;
    }
}
