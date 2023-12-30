using CorePush.Firebase;
using FirebaseAdmin.Messaging;
using Google.Cloud.Firestore;

namespace ASPAPI.Service;

public class MainService
{
    public static DateOnly getDateNow()
    {
        DateTime currentDateTime = DateTime.Now;
        return new DateOnly(currentDateTime.Year, currentDateTime.Month, currentDateTime.Day);
    }
}