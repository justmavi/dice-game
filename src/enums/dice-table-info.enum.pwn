enum E_DICE_TABLE_INFO 
{
    dtId,
    dtDillerId,
    dtPlayersCount,
    dtThrewPlayersCount,
    dtBet,
    dtBank,
    Float: dtTableObjectCoords[E_COORDS],
    dtInterior,
    dtVirtualWorld,
    STREAMER_TAG_OBJECT: dtTableObjectId,
    STREAMER_TAG_AREA: dtTableObjectDynamicZoneId,
    STREAMER_TAG_3D_TEXT_LABEL: dtTableObjectLabelId,
    dtPlayers[MAX_DICE_TABLE_PLAYES],
    dtPlayerResults[MAX_DICE_TABLE_PLAYES],
    dtEmptySlotId,
    dtIsGameStarted,
    dtTime
}