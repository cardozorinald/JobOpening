using JobOpenings.DBContext;
using JobOpenings.Entity;
using JobOpenings.Services.Repository;
using JobOpenings.ViewModel;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace JobOpenings.Services.JobService
{
    public class JobService : Repository<Job>, IJobService
    {
        private readonly JobOpeningContext _context;

        public JobService(JobOpeningContext context) : base(context)
        {
            _context = context;
        }
        public async Task<JobsListViewModel> GetJobList(Request request)
        {

            JobsListViewModel jobsListViewModel = new JobsListViewModel();
            var jobsList = _context.Set<Job>().Where(x => x.Title.Contains(request.search) && (x.LocationId == request.locationId ||
                    request.locationId == 0) && (x.DepartmentId == request.departmentId || request.departmentId == 0))
                    .Include(p => p.Location).Include(x => x.Department)
                    .OrderByDescending(x => x.Id).ToList();
            if (jobsList.Count > 0)
            {
                jobsListViewModel.total = jobsList.Count();
                jobsListViewModel.data = jobsList.Skip(request.pageSize * (request.pageNo - 1)).Take(request.pageSize).ToList();
            }
            return jobsListViewModel;
        }
        public async Task<Job> GetJob(int id)
        {
            var job = _context.Set<Job>().Where(x =>x.Id ==id).Include(x=>x.Location).Include(x=>x.Department).FirstOrDefault();
            return job;
        }
    }
}
