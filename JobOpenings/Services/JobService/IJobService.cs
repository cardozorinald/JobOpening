using JobOpenings.Entity;
using JobOpenings.Services.Repository;
using JobOpenings.ViewModel;
using Microsoft.AspNetCore.Mvc;

namespace JobOpenings.Services.JobService
{
    public interface IJobService : IRepository<Job>
    {
        Task<ActionResult<JobsListViewModel>> GetJobList(Request request);
        Task<ActionResult<Job>> GetJob(int id);
    }
}
