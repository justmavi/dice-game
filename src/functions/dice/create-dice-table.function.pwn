stock CreateDiceTable(i, Float: x, Float: y, Float: z, Float: rx, Float: ry, Float: rz, interior, vw, id) 
{
    new Float: minx = x - (DICE_TABLE_DYNAMIC_ZONE_WIDTH / 2),
        Float: maxx = x + (DICE_TABLE_DYNAMIC_ZONE_WIDTH / 2),
        Float: miny = y - (DICE_TABLE_DYNAMIC_ZONE_LENGTH / 2),
        Float: maxy = y + (DICE_TABLE_DYNAMIC_ZONE_LENGTH / 2);

    DiceTableInfo[i][dtId] = id;
    DiceTableInfo[i][dtTableObjectCoords][cX] = x;
    DiceTableInfo[i][dtTableObjectCoords][cY] = y;
    DiceTableInfo[i][dtTableObjectCoords][cZ] = z;
    DiceTableInfo[i][dtInterior] = interior;
    DiceTableInfo[i][dtVirtualWorld] = vw;

    DiceTableInfo[i][dtTableObjectDynamicZoneId] = CreateDynamicRectangle(minx, miny, maxx, maxy, DiceTableInfo[i][dtVirtualWorld], DiceTableInfo[i][dtInterior]);
    DiceTableInfo[i][dtTableObjectId] = CreateDynamicObject(DICE_TABLE_OBJECT_ID, x, y, z, rx, ry, rz, DiceTableInfo[i][dtVirtualWorld], DiceTableInfo[i][dtInterior]);
    UpdateDiceTable3DText(i);

    Streamer_SetIntData(STREAMER_TYPE_AREA, DiceTableInfo[i][dtTableObjectDynamicZoneId], E_STREAMER_EXTRA_ID, DICE_TABLE_AREA_MIN_ID + i);

    Iter_Add(DiceTables, i);

    CreateDicePerTableTextdraws(i);

    return DiceTableInfo[i][dtTableObjectId];
}