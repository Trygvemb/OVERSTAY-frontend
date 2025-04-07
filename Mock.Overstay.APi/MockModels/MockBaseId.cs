using System.Text.Json.Serialization;

namespace Mock.Overstay.APi.MockModels;

public abstract class MockBaseId
{
    [JsonPropertyOrder(-1)]
    public Guid Id { get; set; }
}