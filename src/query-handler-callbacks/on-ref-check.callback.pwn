static const refTypeUserSuccessMsgPattern[] = "Благодарим игрока "CWHITE"\"%s\" "CGREEN"за то, что поставил Вас на верный путь!";
static const refTypePromoSuccessMsgPattern[] = "Поздравляем! Вы активировали промокод "CWHITE"\"%s\".";

forward OnRefCheck(playerid, const referer[]);
public OnRefCheck(playerid, const referer[])
{
    if (!cache_num_rows()) 
    {
        SendClientMessage(playerid, COLOR_GREY, !"Такой игрок / промокод не существует!");
        return Dialog_Show(playerid, !"TemplateOfRefInputDialog");
    }

    new id, 
        E_REF_TYPE: type;

    cache_get_value_name_int(0, "type", type);
    cache_get_value_name_int(0, "id", id);

    if (type == REF_TYPE_USER)
    {
        PlayerData[playerid][pRefId] = id;

        new message[sizeof(refTypeUserSuccessMsgPattern) - 2 + MAX_PLAYER_NAME];
        format(message, sizeof(message), refTypeUserSuccessMsgPattern, referer);

        SendClientMessage(playerid, COLOR_GREEN, message);
        SendClientMessage(playerid, COLOR_GREEN, !"После достижении 5 уровня ему будут переведены средства!");
    }
    else
    {
        PlayerData[playerid][pPromoId] = id;

        new message[sizeof(refTypePromoSuccessMsgPattern) - 2 + MAX_PLAYER_NAME];
        format(message, sizeof(message), refTypePromoSuccessMsgPattern, referer);

        SendClientMessage(playerid, COLOR_GREEN, message);
        SendClientMessage(playerid, COLOR_GREEN, !"После достижении 5 уровня Вам будет выдан бонус!");
    }
}