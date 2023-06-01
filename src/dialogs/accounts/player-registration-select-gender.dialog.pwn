static const SelectGenderMessagePattern[] = "Выбран пол — "CWHITE"";
static const AvailableGenders[][] = { "Мужской", "Женский" };

dtempl TemplateOfGenderSelectDialog(playerid)
{
    new body[sizeof AvailableGenders * sizeof AvailableGenders[] + 8 + 1] = CWHITE;

    for (new i = 0; i < sizeof(AvailableGenders); i++)
    {
        strcat(body, AvailableGenders[i]);
        strcat(body, "\n");
    }

    return Dialog_Open(playerid, 
        dfunc: GenderSelectionDialog,
        DIALOG_STYLE_LIST,
        FormatDialogTitle("Регистрация", "Выбор пола"),
        body,
        !""CWHITE"Выбор",
        !""CWHITE"Назад"
    );
}

dialog GenderSelectionDialog(playerid, response, listitem) 
{
    if (!response) return Dialog_Show(playerid, !"TemplateOfRefInputDialog");

    new E_GENDER: gender = E_GENDER: (listitem + 1);

    if (gender != GENDER_MALE && gender != GENDER_FEMALE) // я не ебу, мб можно с помощью читов отправить другой listitem
    {
        SendClientMessage(playerid, COLOR_GREY, !"Выберите правильный пол!");
        return Dialog_Show(playerid, !"TemplateOfGenderSelectDialog");
    }

    PlayerData[playerid][pGender] = gender;
    
    new message[sizeof SelectGenderMessagePattern + sizeof AvailableGenders[]];
    strcat(message, SelectGenderMessagePattern);
    strcat(message, AvailableGenders[listitem]);

    SendClientMessage(playerid, COLOR_GREEN, message);

    return 1;
}