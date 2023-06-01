#undef MAX_PLAYERS
#define MAX_PLAYERS (10)

#undef MAX_PLAYER_NAME
#define MAX_PLAYER_NAME (20)

#define SERVER_NAME "My World | 0.3.7"

#define TDW_DIALOG_SKIP_ARGS
#define ClearDeathMessageToPlayer(%0) for(new f; f<6;f++)SendDeathMessageToPlayer(%0, 5465, 5665, 15456)