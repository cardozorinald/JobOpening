using JobOpenings.Entity;
using JobOpenings.Services;
using JobOpenings.Services.DepartmentService;
using JobOpenings.Services.JobService;
using JobOpenings.Services.LocationService;
using JobOpenings.ViewModel;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Http.Extensions;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore.Metadata.Internal;
using System.Net.Http.Headers;
using System.Threading.Tasks;

namespace JobOpenings.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class JobController : Controller
    {
        private readonly IJobService _jobService;
        private readonly ILocationService _locationService;
        private readonly IDepartmentService _departmentService;

        public JobController(IJobService jobService, IDepartmentService departmentService,ILocationService locationService)
        {
            _jobService = jobService;
            _locationService = locationService;
            _departmentService = departmentService;
        }
        [HttpGet("{id}")]
        public async Task<ActionResult<List<Job>>> GetJob(int id)
        {
            var response = _jobService.GetById(id);
            return Ok(response);
        }
        [HttpPost]
        [Route("GetJobsList")]
        public async Task<ActionResult<List<Job>>> GetJobsList(Request request)
        {
            var response = _jobService.GetJobList(request);
            return Ok(response);
        }
        [HttpPost]
        public async Task<ActionResult<Job>> AddJob(JobModel jobViewModel)
        {
            try
            {
                if (jobViewModel.DepartmentId == 0 || jobViewModel.LocationId == 0)
                {
                    return BadRequest("Enter a valid DepartmentID and LocationID");
                }
                Job job = new Job
                {
                    Title = jobViewModel.Title,
                    Description = jobViewModel.Description,
                    LocationId = jobViewModel.LocationId,
                    DepartmentId = jobViewModel.DepartmentId,
                    ClosingDate = jobViewModel.ClosingDate,
                    PostedDate = DateTime.UtcNow
                };
                var data = _jobService.Add(job);
                return StatusCode(201,new Uri($"{Request.Scheme}://{Request.Host}{Request.Path}/{data.Id}"));
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }
        [HttpPut("{id}")]
        public async Task<ActionResult> UpdateJob(int id,JobModel jobViewModel)
        {
            try
            {
                if (jobViewModel.DepartmentId == 0 || jobViewModel.LocationId == 0)
                {
                    return BadRequest("Enter a valid DepartmentID and LocationID");
                }
                var job = new Job
                {
                    Id = id,
                    Title = jobViewModel.Title,
                    Description = jobViewModel.Description,
                    LocationId = jobViewModel.LocationId,
                    DepartmentId = jobViewModel.DepartmentId,
                    ClosingDate = jobViewModel.ClosingDate,
                };
                _jobService.Modify(job);
                return Ok();
            }
            catch(Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }
    }
}
