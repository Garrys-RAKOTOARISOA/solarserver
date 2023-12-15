namespace ASPAPI.Service;

public class Fonction
{
    public static string GetTimeStamp()
    {
        DateTime currentDateTime = DateTime.Now;

        long unixTimestamp = (long)(currentDateTime - new DateTime(1970, 1, 1, 0, 0, 0, DateTimeKind.Utc)).TotalSeconds;

        string timestampString = unixTimestamp.ToString();

        return timestampString;
    }
}