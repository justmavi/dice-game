dtempl TemplateOfRefInputDialog(playerid) 
{
    return Dialog_Open(playerid, 
        dfunc: RefInputDialog,
        DIALOG_STYLE_INPUT, 
        FormatDialogTitle("Регистрация", "Приглашенный игрок"),
        !"{FFFFFF}Введите никнейм приглашённого игрока или промокод",
        !"Ввод",
        !"Пропустить"
    );
}

dialog RefInputDialog(playerid, response, const inputtext[])
{
    if (!response) 
    {
        // TODO: save player account
        return 1;
    }

    static const queryStringPattern[] = "SELECT `id`, 1 as type FROM `accounts` WHERE `nick` = '%q' UNION ALL SELECT `id`, 2 as type FROM `promocodes` WHERE `name` = '%q'";
    new queryString[sizeof queryStringPattern - 4 + MAX_PLAYER_NAME * 2];

    format(queryString, sizeof(queryString), queryStringPattern, inputtext, inputtext);
    mysql_tquery(dbConnection, queryString, "OnRefCheck", "ds", playerid, inputtext);

    return 1;
}