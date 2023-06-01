static const RegistrationDialogBody[] = "{B4B5B7}______________________________________\
    \n\n Добро пожаловать на сервер "SERVER_NAME"{B4B5B7}\
    \n       Регистрация нового персонажа\
    \n\nЛогин: {BFC0C2}%s{B4B5B7}\nВведите пароль:\
    \n______________________________________";

dtempl TemplateOfRegistrationDialog(playerid) 
{
    new registrationDialogBody[sizeof RegistrationDialogBody - 1 + MAX_PLAYER_NAME];
    format(registrationDialogBody, sizeof(registrationDialogBody), RegistrationDialogBody, PlayerData[playerid][pName]);

    return Dialog_Open(playerid, 
        dfunc: PlayerRegistrationDialog, 
        DIALOG_STYLE_PASSWORD, 
        FormatDialogTitle("Вход", "Регистрация"), 
        registrationDialogBody,
        !"Ввод",
        !"Выйти"
    );
}

dialog PlayerRegistrationDialog(playerid, response, inputtext[])
{
    if (!response)
    {
        SendClientMessage(playerid, COLOR_LIGHTRED, !"Введите /q(uit), чтобы выйти из игры");
        return Kick(playerid);
    }

    new len = strlen(inputtext);
    if (len < MIN_PASSWORD_LENGTH || len > MAX_PASSWORD_LENGTH)
    {
        SendClientMessage(playerid, COLOR_GREY, !"Минимальная длина пароля — "MIN_PASSWORD_LENGTH_STR", максимальная — "MAX_PASSWORD_LENGTH_STR"");
        return Dialog_Show(playerid, !"TemplateOfRegistrationDialog");
    }

    bcrypt_hash(playerid, "OnRegistrationPasswordHash", inputtext, BCRYPT_PASS_HASH_ROUNDS);
    return 1;
}

forward OnRegistrationPasswordHash(playerid);
public OnRegistrationPasswordHash(playerid)
{
    bcrypt_get_hash(PlayerData[playerid][pPasswordHash]);
    Dialog_Show(playerid, !"TemplateOfRefInputDialog");
    
    return 1;
}