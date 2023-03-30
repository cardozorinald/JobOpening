using JobOpenings.Entity;
using JobOpenings.Services.Repository;
using JobOpenings.ViewModel;
using Microsoft.AspNetCore.Mvc;

namespace JobOpenings.Services.DepartmentService
{
    public interface IDepartmentService : IRepository<Department>
    {
    }
}
