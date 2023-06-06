import ballerina/http;
import address_check_api.database;
import address_check_api.types;
import address_check_api.constants;

service / on new http:Listener(9090) {

    # Get residents details of a given address
    #
    # + fileType - Content type for the request
    # + data - Payload containing the address information
    # + return - Json array of residents living under the given address
    isolated resource function post residentsByAddress(@http:Header {name: "Content-Type"} string fileType, @http:Payload json data) returns json[]|types:AppServerError|types:AppBadRequestError|error {
        json payload = check data.cloneWithType();
        string address =  <string> check payload.address;
        json[]|error outputs = database:getResidentsByAddress(address);
        if outputs is error {
            return <types:AppServerError>{
                body: {message: constants:INTERNAL_ERROR}
            };
        }
        else if outputs == [] {
            return <types:AppBadRequestError>{
                body: {message: constants:ADDRESS_NOT_FOUND}
            };
        }
        return outputs;
    }
}
