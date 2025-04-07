namespace Mock.Overstay.APi.MockModels;

public class MockVisa : MockBaseId
{
    public DateTime ArrivalDate { get; set; }
    public DateTime ExpireDate { get; set; }

    public MockVisaType? VisaType { get; set; }
}