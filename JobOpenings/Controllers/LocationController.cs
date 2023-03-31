using JobOpenings.Entity;
using JobOpenings.Services.JobService;
using JobOpenings.Services.LocationService;
using JobOpenings.ViewModel;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace JobOpenings.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class LocationController : Controller
    {
        private readonly ILocationService _locationService;

        public LocationController(ILocationService locationService)
        {
            _locationService = locationService;
        }
        [HttpGet]
        public async Task<ActionResult<List<Location>>> GetLocation()
        {
            try
            {
                var response = _locationService.GetAll();
                return Ok(response);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }
        [HttpPost]
        public async Task<ActionResult<Location>> AddLocation(Location location)
        {
            try
            {
                var response = _locationService.Add(location);
                return Ok(response);

            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }
        [HttpPut("{id}")]
        public async Task<ActionResult> UpdateLocation(int id, Location location)
        {
            try
            {
                _locationService.Modify(location);
                return Ok();
            }
            catch (Exception ex) 
            {
                return BadRequest(ex.Message);
            }
        }
    }
}
