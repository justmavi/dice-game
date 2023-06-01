static const TitlePattern[] = "{FFFFFF}%s | {BC2C2C}%s";

stock FormatDialogTitle(const dialogName[], const info[])
{
    new title[64];
    format(title, sizeof(title), TitlePattern, dialogName, info);

    return title;
}