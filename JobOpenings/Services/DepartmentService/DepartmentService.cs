using JobOpenings.DBContext;
using JobOpenings.Entity;
using JobOpenings.Services.Repository;
using Microsoft.EntityFrameworkCore;

namespace JobOpenings.Services.DepartmentService
{
    public class DepartmentService : Repository<Department>, IDepartmentService
    {
        private readonly JobOpeningContext _context;

        public DepartmentService(JobOpeningContext context) : base(context)
        {
            _context = context;
        }
    }
}
