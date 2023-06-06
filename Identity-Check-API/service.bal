import ballerina/http;
import identity_check_apiss.database;
import identity_check_apiss.types;
import identity_check_apiss.constants;

service / on new http:Listener(9090) {

    # Get identity record by user nic
    #
    # + nic - User nic
    # + return - Json object representing the identity details of the given nic holder
    isolated resource function get identityRecordByNIC(string nic) returns json|types:AppServerError|types:AppBadRequestError|error {
        json|error  output = database:getIdentityByNIC(nic);
        if output is error {
            return <types:AppServerError>{
                body: {message: constants:INTERNAL_ERROR}
            };
        }
        else if output == () {
            return <types:AppBadRequestError>{
                body: {message: constants:ID_NOT_FOUND}
            };
        }
        return output;
    }
}
