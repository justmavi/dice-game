new PlayerStreamedTableId[MAX_PLAYERS] = { -1, ... };
new PlayerEnteredTableId[MAX_PLAYERS] = { -1, ... };
new PlayerSlotInTable[MAX_PLAYERS] = { -1, ... };

new DiceTableInfo[MAX_DICE_TABLES][E_DICE_TABLE_INFO];
new Iterator: DiceTables<MAX_DICE_TABLES>;
new Iterator: DiceTablePlayers[MAX_DICE_TABLES]<MAX_PLAYERS>;

static const ThrowResultStrPattern[] = "%s бросил(а) кости. Выпало: %d и %d.";
static const TableTimerTextPattern[] = "~g~%d";
static const GameResultTextPattern[] = "Игра окончена. Победитель: %s.";

stock OnPlayerEnterDiceTableZone(playerid, tableid)
{
    GameTextForPlayer(playerid, "~b~PRESS ~w~ENTER", 8000, 1);
    
    PlayerStreamedTableId[playerid] = tableid;
    return 1;
}

stock OnPlayerLeaveDiceTableZone(playerid, tableid)
{
    if (PlayerStreamedTableId[playerid] == tableid) PlayerStreamedTableId[playerid] = -1;

    return 1;
}

stock OnPlayerPressEnterAtTheTable(playerid) 
{
    if (PlayerEnteredTableId[playerid] != -1) return 1;

    new tableId = PlayerStreamedTableId[playerid];
    if (tableId == -1) return 1;

    if (PlayerData[playerid][pDiller])
    {
        if (DiceTableInfo[tableId][dtDillerId] != INVALID_PLAYER_ID)
        {
            return SendClientMessage(playerid, COLOR_GREY, !"За этим столом уже стоит крупье!");
        }

        DiceTableInfo[tableId][dtDillerId] = playerid;
    }

    for (new i = 0; i < sizeof(DicePerTableTextDraws[]); i++)
    {
        if (i < sizeof(DiceGlobalTextDraws))
            TextDrawShowForPlayer(playerid, DiceGlobalTextDraws[i]);

        TextDrawShowForPlayer(playerid, DicePerTableTextDraws[tableId][i]);
    }

    new str[11];
    valstr(str, PlayerData[playerid][pMoney]);

    CreateDiceTablePlayerTextDraw(playerid, str);
    PlayerTextDrawShow(playerid, DiceTablePlayerTextDraw[playerid]);

    SelectTextDraw(playerid, 0x3495EB55);
    PlayerEnteredTableId[playerid] = tableId;

    Iter_Add(DiceTablePlayers[tableId], playerid);
    UpdateDiceTable3DText(tableId);

    return 1;
}

stock OnPlayerWantToLeaveTable(playerid) 
{
    if (PlayerEnteredTableId[playerid] == -1) return 1;
    return Dialog_Show(playerid, !"TemplateOfLeaveTableDialog");
}

stock OnDicePlayerDisconnect(playerid)
{
    new tableId = PlayerEnteredTableId[playerid];
    if (tableId == -1) return 1; 

    RemovePlayerFromDiceTable(playerid);

    return 1;
}

stock OnPlayerClickDiceTableTextDraw(playerid, Text: clickedid) 
{
    new tableId = PlayerEnteredTableId[playerid];
    if (tableId == -1) return 1;

    if (clickedid == DiceGlobalTextDraws[DICE_TABLE_SETBET_TD_IDX])
    {
        if (DiceTableInfo[tableId][dtIsGameStarted]) return SendClientMessage(playerid, COLOR_GREY, !"Дождитесь следующего раунда!");

        if (PlayerData[playerid][pDiller]) 
        {
            if (DiceTableInfo[tableId][dtPlayersCount] > 0) return SendClientMessage(playerid, COLOR_GREY, !"Кто-то уже поставил ставку. Попросите, чтобы её сняли.");
            
            return Dialog_Show(playerid, !"TemplateOfSetBetDialog");
        }

        new slot = DiceTableInfo[tableId][dtEmptySlotId],
            bet = DiceTableInfo[tableId][dtBet];

        if (PlayerSlotInTable[playerid] != -1) return SendClientMessage(playerid, COLOR_GREY, !"Вы уже поставили ставку! Чтобы снимать, нажмите \"EXIT\" или \"ESC\".");
        if (!bet) return SendClientMessage(playerid, COLOR_GREY, !"Подождите, пока крупье установит ставку!");
        if (slot == -1) return SendClientMessage(playerid, COLOR_GREY, !"За столом больше нет свободных мест!");
        if (!HasPlayerMoney(playerid, bet)) return SendClientMessage(playerid, COLOR_GREY, !"Недостаточно средств на руках!");

        PlayerSlotInTable[playerid] = slot;
        DiceTableInfo[tableId][dtPlayersCount]++;
        DiceTableInfo[tableId][dtPlayers][slot] = playerid;
        DiceTableInfo[tableId][dtPlayerResults][slot] = 0;
        DiceTableInfo[tableId][dtBank] += bet;
        DiceTableInfo[tableId][dtEmptySlotId] = FindFreeIndex(DiceTableInfo[tableId][dtPlayers], slot, INVALID_PLAYER_ID);

        SetPlayerMoney(playerid, -bet);
        UpdateDiceTable3DText(tableId);

        UpdateDiceTableTextDraws(tableId, UPDATE_TYPE_BANK_AND_PLAYERS, slot);
    }

    if (clickedid == DiceGlobalTextDraws[DICE_TABLE_DICE_TD_IDX])
    {
        if (PlayerData[playerid][pDiller]) 
        {
            if (DiceTableInfo[tableId][dtIsGameStarted]) return SendClientMessage(playerid, COLOR_GREY, !"Игра уже запущена!");
            if (DiceTableInfo[tableId][dtPlayersCount] < DICE_MIN_PLAYERS_NEED_TO_START) return SendClientMessage(playerid, COLOR_GREY, !"Дождитесь игроков!");

            SendClientMessage(playerid, COLOR_GREEN, !"Игра успешно запущена! У игроков 15 секунд, чтобы бросить кости.");
            StartDiceGame(tableId);
        }
        else
        {
            if (!DiceTableInfo[tableId][dtIsGameStarted]) return SendClientMessage(playerid, COLOR_GREY, !"Игра ещё не началась!");
            
            new slot = PlayerSlotInTable[playerid]; 

            if (slot == -1) return SendClientMessage(playerid, COLOR_GREY, !"Вы не участвуете в этом раунде!");
            if (DiceTableInfo[tableId][dtPlayerResults][slot]) return SendClientMessage(playerid, COLOR_GREY, !"Вы уже бросили кости!");

            ThrowBones(playerid);
            UpdateDiceTableTextDraws(tableId, UPDATE_TYPE_PLAYERS, slot);

            if (DiceTableInfo[tableId][dtThrewPlayersCount] == DiceTableInfo[tableId][dtPlayersCount] && DiceTableInfo[tableId][dtTime] > 2)
            {
                DiceTableInfo[tableId][dtTime] = 2;
            }
        }

        return 1;
    }

    if (clickedid == DiceGlobalTextDraws[DICE_TABLE_EXIT_TD_IDX]) return OnPlayerWantToLeaveTable(playerid);

    return 1;
}

stock InitializeDiceSystem()
{
    print(!"[Dice Tables] Loading dice tables...");

    Iter_Init(DiceTablePlayers);
    
    for (new i = 0; i < MAX_DICE_TABLES; i++) 
    {
        DiceTableInfo[i] = E_DICE_TABLE_INFO_INIT;
    }

    mysql_tquery(dbConnection, !"SELECT * FROM `dice_tables`", !"LoadDiceTables", !"");
}
stock RemovePlayerFromDiceTable(playerid) 
{
    new tableId = PlayerEnteredTableId[playerid];
    if (tableId == -1) return 0;

    PlayerEnteredTableId[playerid] = -1;
    PlayerTextDrawDestroy(playerid, DiceTablePlayerTextDraw[playerid]);
    DiceTablePlayerTextDraw[playerid] = PlayerText:INVALID_TEXT_DRAW;

    if (DiceTableInfo[tableId][dtDillerId] == playerid)
    {
        DiceTableInfo[tableId][dtDillerId] = INVALID_PLAYER_ID;
    }
    else 
    {
        new slot = PlayerSlotInTable[playerid];
        if (slot != -1)
        {
            DiceTableInfo[tableId][dtPlayers][slot] = INVALID_PLAYER_ID;
            
            if (slot < DiceTableInfo[tableId][dtEmptySlotId]) DiceTableInfo[tableId][dtEmptySlotId] = slot;
            DiceTableInfo[tableId][dtPlayersCount]--;

            PlayerSlotInTable[playerid] = -1;

            if (!DiceTableInfo[tableId][dtIsGameStarted])
            {
                new bet = DiceTableInfo[tableId][dtBet];

                SetPlayerMoney(playerid, bet);
                DiceTableInfo[tableId][dtBank] -= bet;

                UpdateDiceTableTextDraws(tableId, UPDATE_TYPE_BANK_AND_PLAYERS, slot);
            }
            else
            {
                if (!DiceTableInfo[tableId][dtPlayerResults][slot])
                {
                    if (DiceTableInfo[tableId][dtThrewPlayersCount] == DiceTableInfo[tableId][dtPlayersCount] && DiceTableInfo[tableId][dtTime] > 2)
                    {
                        DiceTableInfo[tableId][dtTime] = 2;
                    }
                }
                
                DiceTableInfo[tableId][dtPlayerResults][slot] = 0;

                UpdateDiceTableTextDraws(tableId, UPDATE_TYPE_PLAYERS, slot);
            }
        }
    }

    ClearAnimations(playerid);

    Iter_Remove(DiceTablePlayers[tableId], playerid);
    UpdateDiceTable3DText(tableId);
    CancelSelectTextDraw(playerid);

    return 1;
}

forward OnDiceTableHandling();
public OnDiceTableHandling()
{
    new timerText[sizeof(TableTimerTextPattern)],
        gameResultText[sizeof(GameResultTextPattern) - 2 + MAX_PLAYER_NAME],
        maxResult,
        winnersCount,
        winnerId,
        winnerIdx;

    foreach (new tableId : DiceTables)
    {
        if (!DiceTableInfo[tableId][dtIsGameStarted]) continue;

        DiceTableInfo[tableId][dtTime]--;

        format(timerText, sizeof(timerText), TableTimerTextPattern, DiceTableInfo[tableId][dtTime]);
        BroadcastToTablePlayersOnly(tableId, MESSAGE_TYPE_GAME_TEXT, timerText);

        if (DiceTableInfo[tableId][dtTime] == 0)
        {
            winnersCount = 0;

            for (new i = 0; i < MAX_DICE_TABLE_PLAYES; i++)
            {
                if (DiceTableInfo[tableId][dtPlayers][i] == INVALID_PLAYER_ID || DiceTableInfo[tableId][dtPlayerResults][i]) continue;

                ThrowBones(DiceTableInfo[tableId][dtPlayers][i]);
            }

            maxResult = GetMax(DiceTableInfo[tableId][dtPlayerResults]);

            for (new i = 0; i < MAX_DICE_TABLE_PLAYES; i++)
            {
                if (DiceTableInfo[tableId][dtPlayers][i] == INVALID_PLAYER_ID) continue;

                if (DiceTableInfo[tableId][dtPlayerResults][i] < maxResult)
                {
                    PlayerSlotInTable[DiceTableInfo[tableId][dtPlayers][i]] = -1;

                    DiceTableInfo[tableId][dtPlayers][i] = INVALID_PLAYER_ID;
                    DiceTableInfo[tableId][dtPlayerResults][i] = 0;
                }
                else
                {
                    DiceTableInfo[tableId][dtPlayerResults][i] = 0;

                    winnersCount++;
                    winnerIdx = i;
                }
            }

            if (winnersCount == 1)
            {
                winnerId = DiceTableInfo[tableId][dtPlayers][winnerIdx];
                SetPlayerMoney(winnerId, DiceTableInfo[tableId][dtBank]);

                DiceTableInfo[tableId][dtPlayers][winnerIdx] = INVALID_PLAYER_ID;
                DiceTableInfo[tableId][dtBank] = 
                DiceTableInfo[tableId][dtBet] = 
                DiceTableInfo[tableId][dtThrewPlayersCount] = 
                DiceTableInfo[tableId][dtEmptySlotId] =
                DiceTableInfo[tableId][dtPlayersCount] = 0;
                DiceTableInfo[tableId][dtIsGameStarted] = false; 

                PlayerSlotInTable[winnerId] = -1;

                format(gameResultText, sizeof(gameResultText), GameResultTextPattern, PlayerData[winnerId][pName]);
                foreach (new playerid : DiceTablePlayers[tableId]) SendClientMessage(playerid, COLOR_HARD_PURPLE, gameResultText);

                UpdateDiceTableTextDraws(tableId, UPDATE_TYPE_ALL);
            }
            else
            {
                DiceTableInfo[tableId][dtThrewPlayersCount] = 0;
                DiceTableInfo[tableId][dtPlayersCount] = winnersCount;

                StartDiceGame(tableId);
                UpdateDiceTableTextDraws(tableId, UPDATE_TYPE_PLAYERS);
            }

            UpdateDiceTable3DText(tableId);
        }
    }
}

stock ThrowBones(playerid)
{
    new tableId = PlayerEnteredTableId[playerid],
        slot = PlayerSlotInTable[playerid];

    if (tableId == -1 || slot == -1) return 0;

    new bone1Result = BONE_MIN_VALUE + random(BONE_MAX_VALUE),
        bone2Result = BONE_MIN_VALUE + random(BONE_MAX_VALUE);
    
    new throwResultStr[sizeof(ThrowResultStrPattern) - 2 + MAX_PLAYER_NAME];
    format(throwResultStr, sizeof(throwResultStr), ThrowResultStrPattern, PlayerData[playerid][pName], bone1Result, bone2Result);

    foreach (new i : DiceTablePlayers[tableId]) SendClientMessage(i, COLOR_PURPLE, throwResultStr);

    DiceTableInfo[tableId][dtPlayerResults][slot] = bone1Result + bone2Result;
    DiceTableInfo[tableId][dtThrewPlayersCount]++;

    return 1;
}

stock StartDiceGame(tableId) 
{
    DiceTableInfo[tableId][dtTime] = DICE_TIMER_TIME;
    DiceTableInfo[tableId][dtIsGameStarted] = true;
    BroadcastToTablePlayersOnly(tableId, MESSAGE_TYPE_CHAT_TEXT, !"У Вас "DICE_TIMER_TIME_STR" секунд, чтобы бросить кости (кнопка \"DICE\"), иначе система сделает это за вас!", COLOR_HARD_PURPLE);
}