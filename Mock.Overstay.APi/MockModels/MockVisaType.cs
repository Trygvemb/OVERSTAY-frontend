namespace Mock.Overstay.APi.MockModels;

public class MockVisaType : MockBaseId
{
    public string? Name { get; set; }
    public string? Description { get; set; }
    public int DurationInDays { get; set; }
    public bool IsMultipleEntry { get; set; }
}