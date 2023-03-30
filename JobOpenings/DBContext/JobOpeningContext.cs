using JobOpenings.Entity;
using Microsoft.EntityFrameworkCore;

namespace JobOpenings.DBContext
{
    public class JobOpeningContext : DbContext
    {
        public JobOpeningContext(DbContextOptions<JobOpeningContext> options) : base(options) { }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            base.OnConfiguring(optionsBuilder);
            optionsBuilder.UseSqlServer("Server=.\\SQLEXPRESS;Database=JobOpenings;Trusted_Connection=true; TrustServerCertificate=true;");
        }
        public DbSet<Job> Jobs { get; set; }
        public DbSet<Department> Departments { get; set; }
        public DbSet<Location> Locations { get; set; }
    }
}
