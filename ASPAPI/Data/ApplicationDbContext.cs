using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using ASPAPI.Models;

namespace ASPAPI.Data;
public class ApplicationDbContext : IdentityDbContext
{
    public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options)
        : base(options)
    {
    }
    
    public DbSet<ASPAPI.Models.Client> Client { get; set; } = default!;
    
    public DbSet<ASPAPI.Models.Batterie> Batterie { get; set; } = default!;
    
    public DbSet<ASPAPI.Models.Module> Module { get; set; } = default!;
    
    public DbSet<ASPAPI.Models.Donnees> Donnnes { get; set; } = default!;
}