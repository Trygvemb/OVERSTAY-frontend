namespace Mock.Overstay.APi.MockModels;

public class MockUser : MockBaseId
{
    public string FirstName { get; set; } = string.Empty;
    public string LastName { get; set; } = string.Empty;
    public string Email { get; set; } = string.Empty;
    public string Password { get; set; } = string.Empty;
    public string UserName { get; set; } = string.Empty;

    public Guid NotificationId { get; set; }
    public MockCountry? Country { get; set; }
    public List<MockVisa> Visas { get; set; } = new List<MockVisa>();
}