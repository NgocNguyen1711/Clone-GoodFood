# IF THERE ARE ANY CHANGES IN DATABASE, PLEASE UPDATE C# ENTITIES BY THESE STEPS
1. Change Startup Project in Visual Studio from docker-compose to GOODFOODAPI. 
2. If your ide does not have Package Manager Console, open it from View/Other Windows/Package Manager Console.
3. Use
`Scaffold-DbContext Name=GoodFoodConnection1 Microsoft.EntityFrameworkCore.SqlServer -OutputDir Domains/Entities -ContextDir Database -f`
to generate new entities and context.