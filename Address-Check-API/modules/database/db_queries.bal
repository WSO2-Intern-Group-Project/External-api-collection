# Query to get requests by user
#
# + nic - email of the user
# + return - query string

public isolated function getPoliceReportsByNICQuery(string nic) returns string =>
    string `SELECT c.NIC, c.date, c.description FROM c  WHERE c.NIC = '${nic}'`;
