stock GetMax(const arr[], startIdx = 0, len = sizeof(arr))
{
    new maxVal = arr[startIdx];

    for (new i = startIdx + 1; i < len; i++)
    {
        if (arr[i] > maxVal) maxVal = arr[i];
    }

    return maxVal;
}