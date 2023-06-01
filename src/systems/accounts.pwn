new PlayerData[MAX_PLAYERS][E_PLAYER_INFO];

stock OnPlayerInitializingAccount(playerid) 
{
    PlayerData[playerid] = E_PLAYER_INFO_INIT;
    GetPlayerName(playerid, PlayerData[playerid][pName], MAX_PLAYER_NAME);

    static const queryStringPattern[] = "SELECT * FROM `accounts` WHERE `nick` = '%q'";
    new queryString[sizeof queryStringPattern - 2 + MAX_PLAYER_NAME]; 
    
    format(queryString, sizeof(queryString), queryStringPattern, PlayerData[playerid][pName]);
    mysql_tquery(dbConnection, queryString, "LoadPlayerAccount", "d", playerid);

    return 1;
}