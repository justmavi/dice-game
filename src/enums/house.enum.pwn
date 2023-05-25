enum E_HOUSE_INFO_ENUM
{
    hId,
    hOwnerNick[MAX_PLAYER_NAME],
    hOwnerId,
    hCoords[E_COORDS], // pickup coords
    STREAMER_TAG_PICKUP: hPickupId,
    STREAMER_TAG_MAP_ICON: hMapIconId,
    STREAMER_TAG_AREA: hAreaId,
    hInterior,
    hVirtualWorld,
    bool: hLock,
    hBalance,
    hMedkitCount,
    hWardrobeCoords[E_COORDS]
}