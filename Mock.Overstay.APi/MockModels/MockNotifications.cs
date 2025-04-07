namespace Mock.Overstay.APi.MockModels;

public class MockNotifications : MockBaseId
{
    public bool EmailNotification { get; set; }
    public bool SmsNotification { get; set; }
    public bool PushNotification { get; set; }
}