using JobOpenings.Entity;
using JobOpenings.Services.Repository;
using JobOpenings.ViewModel;
using Microsoft.AspNetCore.Mvc;

namespace JobOpenings.Services.LocationService
{
    public interface ILocationService : IRepository<Location>
    {
        //Task<ActionResult<JobViewModel>> AddLocation(Location location);
        //Task<ActionResult<JobViewModel>> GetAllLocation();
        //Task<ActionResult<JobViewModel>> GetLocation(int id);
        //Task<ActionResult<JobViewModel>> UpdateLocation(Location location);
    }
}
