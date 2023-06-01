enum E_PLAYER_INFO 
{
    Cache: pCacheIndex,
    pName[MAX_PLAYER_NAME + 1],
    pPasswordHash[BCRYPT_HASH_LENGTH],
    pRefId,
    pPromoId,
    pMoney,
    bool: pDiller,
}