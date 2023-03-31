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

        public JobController(IJobService jobService)
        {
            _jobService = jobService;
        }
        [HttpGet("{id}")]
        public async Task<ActionResult<Job>> GetJob(int id)
        {
            var job = await _jobService.GetJob(id);
            return Ok(job);
        }
        [HttpPost]
        [Route("JobsList")]
        public async Task<ActionResult<JobsListViewModel>> GetJobsList(Request request)
        {
            var response = await _jobService.GetJobList(request);
            return Ok(response);
        }
        [HttpPost]
        [ProducesResponseType(typeof(void), 201)]
        public async Task<ActionResult> AddJob(JobModel jobViewModel)
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
                    PostedDate = DateTime.UtcNow
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
