forward LoadPlayerAccount(playerid);
public LoadPlayerAccount(playerid)
{
    if (!cache_num_rows())
    {
        Dialog_Show(playerid, !"TemplateOfRegistrationDialog");
        return 1;
    }

    PlayerData[playerid][pCacheIndex] = cache_save();
    cache_get_value_name(0, "password_hash", PlayerData[playerid][pPasswordHash], BCRYPT_HASH_LENGTH);

    Dialog_Show(playerid, !"TemplateOfPlayerLoginPasswordInputDialog");
    return 1;
}