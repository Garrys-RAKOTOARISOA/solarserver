using ASPAPI.Models;
using CorePush.Firebase;

namespace ASPAPI.Service;

public class MainService
{
    public async Task sendNotification()
    {
        var firebaseSettingsJson = await File.ReadAllTextAsync("./project-123.json");
        var httpClient = new HttpClient();
        var fcm = new FirebaseSender(firebaseSettingsJson, httpClient);

        var notification = new Notification
        {
            Title = "Votre notification",
            Body = "Your notification body"
        };

        await fcm.SendAsync(notification);
    }
}