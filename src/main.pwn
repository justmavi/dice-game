#include "a_samp"
#include "./src/constants/index.pwn"

#include "a_mysql"
#include "foreach"
#include "sscanf2"
#include "Pawn.CMD"
#include "streamer"
//#include "skip_samp_skin_select"
#include "timerfix"
#include "tdw_dialog"
#include "samp_bcrypt"
#include "nex-ac_ru.lang"
#include "nex-ac"
#pragma warning disable 239

#include "./src/enums/index.pwn"
#include "./src/initializers/index.pwn"

main() { }

new MySQL: dbConnection;

#include "./src/textdraws/index.pwn"
#include "./src/systems/index.pwn"
#include "./src/query-handler-callbacks/index.pwn"
#include "./src/mapping/index.pwn"
#include "./src/functions/index.pwn"
#include "./src/commands/index.pwn"
#include "./src/dialogs/index.pwn"

public OnGameModeInit()
{
	print(!"[Gamemode] Loading gamemode...");
	print(!"[MySQL] Trying to connect to database...");

	dbConnection = mysql_connect_file("mysql.ini");

	if (mysql_errno(dbConnection) != 0) 
	{
		print(!"[MySQL] Could not connect to database!");
        print(!"[ERROR] Cannot start server");
        return 0;
	}
	else 
	{
		print(!"[MySQL] Successfully connected to database");
	}
    
    mysql_query_file(dbConnection, !"db-init.sql", false);

    InitializeDiceSystem();

    SetTimerEx_("OnTimerTick", 1000, 0, -1, ""); 

    return 1;
}

public OnGameModeExit()
{
    mysql_close(dbConnection);
    
    return 1;
}

public OnPlayerConnect(playerid) 
{

    TogglePlayerSpectating(playerid, 1);
	SetPlayerCameraPos(playerid, -2610.0212,2292.5464,8.3594);
	SetPlayerCameraLookAt(playerid, -2610.0212,2292.5464,8.3594);

	ClearDeathMessageToPlayer(playerid);

    OnPlayerInitializingAccount(playerid);

    Remove4DragonObjectsForPlayer(playerid);

    return 1;
}

public OnPlayerDisconnect(playerid, reason) 
{
    if (PlayerEnteredTableId[playerid] != -1) return OnDicePlayerDisconnect(playerid);

    PlayerData[playerid] = E_PLAYER_INFO_INIT;
    return 1;
}

public OnPlayerEditDynamicObject(playerid, STREAMER_TAG_OBJECT: objectid, response, Float:x, Float:y, Float:z, Float:rx, Float:ry, Float:rz)
{
    if (PlayerEditDiceTableId[playerid] == objectid) 
    {
        return OnPlayerEditDiceTableObject(playerid, objectid, response, x, y, z, rx, ry, rz);
    }

    return 1;
}

public OnPlayerClickTextDraw(playerid, Text:clickedid)
{
    if (clickedid == Text:INVALID_TEXT_DRAW)
    {
        if (PlayerEnteredTableId[playerid] != -1) return OnPlayerWantToLeaveTable(playerid);
    }

    if (clickedid == DiceGlobalTextDraws[DICE_TABLE_SETBET_TD_IDX] || clickedid == DiceGlobalTextDraws[DICE_TABLE_DICE_TD_IDX] || clickedid == DiceGlobalTextDraws[DICE_TABLE_EXIT_TD_IDX])
    {
        return OnPlayerClickDiceTableTextDraw(playerid, clickedid);
    }

    return 1;
}

public OnPlayerEnterDynamicArea(playerid, STREAMER_TAG_AREA:areaid)
{
    new tableId = Streamer_GetIntData(STREAMER_TYPE_AREA, areaid, E_STREAMER_EXTRA_ID);

    if (tableId >= DICE_TABLE_AREA_MIN_ID && tableId < TABLE_AREA_MAX_ID)
    {
        return OnPlayerEnterDiceTableZone(playerid, tableId - DICE_TABLE_AREA_MIN_ID);
    }

    return 1;
}

public OnPlayerLeaveDynamicArea(playerid, STREAMER_TAG_AREA:areaid)
{
    new tableId = Streamer_GetIntData(STREAMER_TYPE_AREA, areaid, E_STREAMER_EXTRA_ID);

    if (tableId >= DICE_TABLE_AREA_MIN_ID && tableId < TABLE_AREA_MAX_ID)
    {
        return OnPlayerLeaveDiceTableZone(playerid, tableId - DICE_TABLE_AREA_MIN_ID);
    }

    return 1;
}

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
    if (newkeys & KEY_SECONDARY_ATTACK)
    {
        if (PlayerStreamedTableId[playerid] != -1) return OnPlayerPressEnterAtTheTable(playerid);
    }

    return 1;
}

public OnPlayerSpawn(playerid) 
{
    SetPlayerInterior(playerid, 10);
    PreloadAllAnimLibs(playerid);

    return 1;
}

public OnPlayerCommandReceived(playerid, cmd[], params[], flags)
{
	if (!PlayerData[playerid][pIsLoggedIn])
		return SendClientMessage(playerid, COLOR_GREY, "Необходимо авторизоваться!");

	return 1;
}


forward OnTimerTick();
public OnTimerTick()
{
    OnDiceTableHandling();
}