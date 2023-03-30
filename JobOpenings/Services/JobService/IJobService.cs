using JobOpenings.Entity;
using JobOpenings.Services.Repository;
using JobOpenings.ViewModel;
using Microsoft.AspNetCore.Mvc;

namespace JobOpenings.Services.JobService
{
    public interface IJobService : IRepository<Job>
    {
        Task<JobsListViewModel> GetJobList(Request request);
        Task<Job> GetJob(int id);
    }
}
