new PlayerEditDiceTableId[MAX_PLAYERS] = { -1, ... };

CMD:createtable(playerid)
{
    if (!IsPlayerAdmin(playerid)) return SendClientMessage(playerid, COLOR_GREY, !"Вам недоступна эта функция!");
    else if (Iter_Count(DiceTables) == MAX_DICE_TABLES) return SendClientMessage(playerid, COLOR_GREY, !"На сервере уже установлено максимальное количество столов!");

    new Float: x, Float: y, Float: z;
    GetPlayerPos(playerid, x, y, z);

    new objectId = CreateDynamicObject(DICE_TABLE_OBJECT_ID, x, y - 10.0, z, 0.0, 0.0, 0.0, GetPlayerVirtualWorld(playerid), GetPlayerInterior(playerid), playerid);
    PlayerEditDiceTableId[playerid] = objectId;

    EditDynamicObject(playerid, objectId);

    SendClientMessage(playerid, COLOR_YELLOW, !"Поставьте стол в нужное место и сохраните. Для отмены нажмите \"ESC\".");
    return 1;
}

stock OnPlayerEditDiceTableObject(playerid, STREAMER_TAG_OBJECT: objectId, response, Float:fX, Float:fY, Float:fZ, Float:fRotX, Float:fRotY, Float:fRotZ)
{
    if (response == EDIT_RESPONSE_UPDATE) return 1;
    if (response == EDIT_RESPONSE_CANCEL) 
    {
        DestroyDynamicObject(objectId);
        SendClientMessage(playerid, COLOR_GREY, !"Вы отменили создание стола.");
        PlayerEditDiceTableId[playerid] = -1;

        return 1;
    }

    new interior = GetPlayerInterior(playerid),
        vw = GetPlayerVirtualWorld(playerid);

    static const queryStringPattern[] = "INSERT INTO `dice_tables` (`x`, `y`, `z`, `rx`, `ry`, `rz`, `interior`, `vw`) VALUES ('%f', '%f', '%f', '%f', '%f', '%f', '%d', '%d')";
    new queryString[sizeof(queryStringPattern) - (8 * 2) + (7 * 13) + 5 + 1];

    DestroyDynamicObject(objectId);

    format(queryString, sizeof(queryString), queryStringPattern, fX, fY, fZ, fRotX, fRotY, fRotZ, interior, vw);
    mysql_tquery(dbConnection, queryString, !"OnDiceTableInsert", !"iffffffii", playerid, fX, fY, fZ, fRotX, fRotY, fRotZ, interior, vw);
    
    PlayerEditDiceTableId[playerid] = -1;

    return 1;
}

forward OnDiceTableInsert(creatorId, Float: x, Float: y, Float: z, Float: rx, Float: ry, Float: rz, interior, vw);
public OnDiceTableInsert(creatorId, Float: x, Float: y, Float: z, Float: rx, Float: ry, Float: rz, interior, vw)
{
    new id = cache_insert_id();
    CreateDiceTable(Iter_Free(DiceTables), x, y, z, rx, ry, rz, interior, vw, id);
    
    SendClientMessage(creatorId, COLOR_GREEN, !"Стол успешно создан! Можно начать играть.");
}