using JobOpenings.Entity;
using JobOpenings.Services.DepartmentService;
using JobOpenings.Services.LocationService;
using JobOpenings.ViewModel;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace JobOpenings.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class DepartmentController : Controller
    {
        private readonly IDepartmentService _departmentService;

        public DepartmentController(IDepartmentService departmentService)
        {
            _departmentService = departmentService;
        }
        [HttpGet]
        public async Task<ActionResult<List<Department>>> GetDepartment()
        {
            try
            {
                var response =  _departmentService.GetAll();
                return Ok(response);
            }
            catch (Exception ex) 
            {
                return BadRequest(ex.Message);
            }
        }
        [HttpPost]
        public async Task<ActionResult<Department>> AddDepartment(string departmentTitle)
        {
            try
            {
                var department = new Department{ Title = departmentTitle};
                var response = _departmentService.Add(department);
                return Ok(response);

            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }
        [HttpPut("{id}")]
        public async Task<ActionResult> UpdateDepartment(int id, string departmentTitle)
        {
            try
            {
                var department = new Department { Id=id , Title = departmentTitle };
                _departmentService.Modify(department);
                return Ok();
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }
    }
}
