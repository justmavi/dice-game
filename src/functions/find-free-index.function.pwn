stock FindFreeIndex(const arr[], lastFreeIndex, emptyCellValue = -1, arrLength = sizeof(arr)) 
{
	for (new i = lastFreeIndex; i < arrLength; i++)
	{
		if (arr[i] == emptyCellValue) return i;
	}

	return -1;
}