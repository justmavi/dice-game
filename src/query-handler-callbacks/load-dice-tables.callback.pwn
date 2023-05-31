forward LoadDiceTables();
public LoadDiceTables() 
{    
    new fetchDataCount = cache_num_rows();

    new Float: x, 
        Float: y, 
        Float: z, 
        Float: rx, 
        Float: ry, 
        Float: rz,
        interior,
        vw,
        id;

    for (new i = 0; i < fetchDataCount; i++)
    {
        cache_get_value_name_int(i, "id", id);
        cache_get_value_name_float(i, "x", x);
        cache_get_value_name_float(i, "y", y);
        cache_get_value_name_float(i, "z", z);
        cache_get_value_name_float(i, "rx", rx);
        cache_get_value_name_float(i, "ry", ry);
        cache_get_value_name_float(i, "rz", rz);
        cache_get_value_name_int(i, "interior", interior);
        cache_get_value_name_int(i, "vw", vw);

        CreateDiceTable(i, x, y, z, rx, ry, rz, interior, vw, id);
    }

    CreateDiceGlobalTextDraws();

    printf("[Dice Tables] Loaded %d tables", fetchDataCount);
}