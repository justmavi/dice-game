/*

	M I S T E V

*/

// ALS prefix FRZPLR


#if !defined _samp_included

    #error Please include <a_samp> first.

#endif


#if defined _FRZPLR_included

    #endinput

#endif

#define _FRZPLR_included


forward TogglePlayerFreeze(playerid, bool:toggle);


static enum E_PLAYER_FREEZE_INFORMATION
{
	bool:playerFreeze,

	Float:xFreeze,
	Float:yFreeze,
	Float:zFreeze,
	Float:aFreeze
}
static freezeInfo[MAX_PLAYERS][E_PLAYER_FREEZE_INFORMATION];


public TogglePlayerFreeze(playerid, bool:toggle)
{
    if(playerid == INVALID_PLAYER_ID) return 0;

    if(toggle)
    {
        if(IsPlayerInAnyVehicle(playerid)) return 0;
        
        freezeInfo[playerid][playerFreeze] = true;

        GetPlayerPos(playerid, freezeInfo[playerid][xFreeze], freezeInfo[playerid][yFreeze], freezeInfo[playerid][zFreeze]);
        GetPlayerFacingAngle(playerid, freezeInfo[playerid][aFreeze]);

        ClearAnimations(playerid, false);
        return ApplyAnimation(playerid, "PED", "IDLE_STANCE", 4.1, true, 0, 0, 0, 0, true);
    }
    else
    {
        freezeInfo[playerid][playerFreeze] = false;

        freezeInfo[playerid][xFreeze] = 0.0;
        freezeInfo[playerid][yFreeze] = 0.0;
        freezeInfo[playerid][zFreeze] = 0.0;
        freezeInfo[playerid][aFreeze] = 0.0;

        return ClearAnimations(playerid, false);
    }
}


public OnPlayerUpdate(playerid)
{
    if(!freezeInfo[playerid][playerFreeze]) return 1;

	static Float:x, Float:y, Float:z, Float:a;

    GetPlayerPos(playerid, x, y, z);
    GetPlayerFacingAngle(playerid, a);

    if(freezeInfo[playerid][xFreeze] != x \
    || freezeInfo[playerid][yFreeze] != y \
    || freezeInfo[playerid][zFreeze] != z \
    || freezeInfo[playerid][aFreeze] != a)
    {
        SetPlayerPos(playerid, freezeInfo[playerid][xFreeze], freezeInfo[playerid][yFreeze], freezeInfo[playerid][zFreeze]);
        SetPlayerFacingAngle(playerid, freezeInfo[playerid][aFreeze]);

        ClearAnimations(playerid, false);
        ApplyAnimation(playerid, "PED", "IDLE_STANCE", 4.1, true, 0, 0, 0, 0, true);

        return 0;
    }

    #if defined FRZPLR_OnPlayerUpdate
        return FRZPLR_OnPlayerUpdate(playerid);
    #else
        return 1;
    #endif
}

#if defined _ALS_OnPlayerUpdate
    #undef OnPlayerUpdate
#else
    #define _ALS_OnPlayerUpdate
#endif
#define OnPlayerUpdate FRZPLR_OnPlayerUpdate
#if defined FRZPLR_OnPlayerUpdate
    forward FRZPLR_OnPlayerUpdate(playerid);
#endif


public OnPlayerDisconnect(playerid, reason)
{
    freezeInfo[playerid][playerFreeze] = false;

    freezeInfo[playerid][xFreeze] = 0.0;
    freezeInfo[playerid][yFreeze] = 0.0;
    freezeInfo[playerid][zFreeze] = 0.0;
    freezeInfo[playerid][aFreeze] = 0.0;

    #if defined FRZPLR_OnPlayerDisconnect
        return FRZPLR_OnPlayerDisconnect(playerid, reason);
    #else
        return 1;
    #endif
}

#if defined _ALS_OnPlayerDisconnect
    #undef OnPlayerDisconnect
#else
    #define _ALS_OnPlayerDisconnect
#endif
#define OnPlayerDisconnect FRZPLR_OnPlayerDisconnect
#if defined FRZPLR_OnPlayerDisconnect
    forward FRZPLR_OnPlayerDisconnect(playerid, reason);
#endif


public OnPlayerDeath(playerid, killerid, reason)
{
    freezeInfo[playerid][playerFreeze] = false;

    freezeInfo[playerid][xFreeze] = 0.0;
    freezeInfo[playerid][yFreeze] = 0.0;
    freezeInfo[playerid][zFreeze] = 0.0;
    freezeInfo[playerid][aFreeze] = 0.0;

    #if defined FRZPLR_OnPlayerDeath
        return FRZPLR_OnPlayerDeath(playerid, killerid, reason);
    #else
        return 1;
    #endif
}

#if defined _ALS_OnPlayerDeath
    #undef OnPlayerDeath
#else
    #define _ALS_OnPlayerDeath
#endif
#define OnPlayerDeath FRZPLR_OnPlayerDeath
#if defined FRZPLR_OnPlayerDeath
    forward FRZPLR_OnPlayerDeath(playerid, killerid, reason);
#endif