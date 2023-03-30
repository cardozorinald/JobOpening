using JobOpenings.DBContext;
using JobOpenings.Entity;
using JobOpenings.Services.Repository;
using Microsoft.EntityFrameworkCore;

namespace JobOpenings.Services.LocationService
{
    public class LocationService : Repository<Location>, ILocationService
    {
        private readonly JobOpeningContext _context;

        public LocationService(JobOpeningContext context) : base(context)
        {
            _context = context;
        }
    }
}
