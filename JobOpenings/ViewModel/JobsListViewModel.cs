using JobOpenings.Entity;

namespace JobOpenings.ViewModel
{
    public class JobsListViewModel
    {
        public int total { get; set; } 
        public List<Job> data { get; set; }
    }
}
