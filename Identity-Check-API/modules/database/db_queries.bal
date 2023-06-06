public isolated function getIdentityByNICQuery(string nic) returns string =>
    string `SELECT c.NIC, c.name, c.address, c.gender, c.DoB, c.placeOfBirth, c.occupation FROM c  WHERE c.NIC = '${nic}'`;
