using Mock.Overstay.APi.MockModels;
using Scalar.AspNetCore;

var builder = WebApplication.CreateBuilder(args);

builder.Services.AddOpenApi();


var app = builder.Build();

if (app.Environment.IsDevelopment())
{
    app.MapOpenApi();
    app.MapScalarApiReference();
}

app.UseHttpsRedirection();

MockData data = new();

app.MapGet("/users", () => data.Users);
app.MapGet("/users/{id}", (Guid id) => data.Users.FirstOrDefault(u => u.Id == id));

app.MapGet("/visas", () => data.Visas);
app.MapGet("/visas/{id}", (Guid id) => data.Visas.FirstOrDefault(v => v.Id == id));

app.MapGet("/visa-types", () => data.VisaTypes);
app.MapGet("/visa-types/{id}", (Guid id) => data.VisaTypes.FirstOrDefault(vt => vt.Id == id));

app.MapGet("/notifications", () => data.Notifications);
app.MapGet("/notifications/{id}", (Guid id) => data.Notifications.FirstOrDefault(n => n.Id == id));

app.Run();