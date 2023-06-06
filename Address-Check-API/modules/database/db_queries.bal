public isolated function getResidentsByAddressQuery(string address) returns string =>
    string `SELECT c.NIC, c.name, c.address FROM c  WHERE c.address = '${address}'`;
