namespace Mock.Overstay.APi.MockModels;

public class MockData
{
    public MockData()
    {
        InitializeMockData();
    }

    public List<MockVisaType> VisaTypes { get; private set; } = new();
    public List<MockNotifications> Notifications { get; private set; } = new();
    public List<MockUser> Users { get; private set; } = new();
    public List<MockVisa> Visas { get; private set; } = new();
    public static List<MockCountry> Countries { get; private set; } = new();

    private void InitializeMockData()
    {
        // Initialize VisaTypes
        VisaTypes = new List<MockVisaType>
        {
            new() { Id = Guid.NewGuid(), Name = "Tourist", Description = "Tourist visa for short stays", DurationInDays = 30, IsMultipleEntry = false },
            new() { Id = Guid.NewGuid(), Name = "Business", Description = "Business visa for commercial activities", DurationInDays = 90, IsMultipleEntry = true },
            new() { Id = Guid.NewGuid(), Name = "Student", Description = "Student visa for educational purposes", DurationInDays = 365, IsMultipleEntry = true }
        };

        // Initialize Countries
        Countries = new List<MockCountry>
        {
            new() { Id = Guid.NewGuid(), Name = "United States", IsoCode = "USA" },
            new() { Id = Guid.NewGuid(), Name = "United Kingdom", IsoCode = "GBR" },
            new() { Id = Guid.NewGuid(), Name = "Canada", IsoCode = "CAN" }
        };

        // Initialize Notifications
        Notifications = new List<MockNotifications>
        {
            new() { Id = Guid.NewGuid(), EmailNotification = true, SmsNotification = true, PushNotification = false },
            new() { Id = Guid.NewGuid(), EmailNotification = true, SmsNotification = false, PushNotification = true }
        };

        // Initialize Visas
        Visas = new List<MockVisa>
        {
            new() { Id = Guid.NewGuid(), ArrivalDate = DateTime.Now.AddDays(-30), ExpireDate = DateTime.Now.AddDays(60), VisaType = VisaTypes[0] },
            new() { Id = Guid.NewGuid(), ArrivalDate = DateTime.Now.AddDays(-15), ExpireDate = DateTime.Now.AddDays(75), VisaType = VisaTypes[1] }
        };

        // Initialize Users
        Users = new List<MockUser>
        {
            new() {
                Id = Guid.NewGuid(),
                FirstName = "John",
                LastName = "Doe",
                Email = "john.doe@example.com",
                Password = "hashedPassword123",
                UserName = "johndoe",
                NotificationId = Notifications[0].Id,
                Country = Countries[0],
                Visas = new List<MockVisa> { Visas[0] }
            },
            new() {
                Id = Guid.NewGuid(),
                FirstName = "Jane",
                LastName = "Smith",
                Email = "jane.smith@example.com",
                Password = "hashedPassword456",
                UserName = "janesmith",
                NotificationId = Notifications[1].Id,
                Country = Countries[1],
                Visas = new List<MockVisa> { Visas[1] }
            }
        };
    }
}