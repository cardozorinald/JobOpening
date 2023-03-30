namespace JobOpenings.ViewModel
{
    public class Request
    {
        public string? search { get; set; }
        public int pageNo { get; set; }
        public int pageSize { get; set; }
        public int locationId { get; set; }
        public int departmentId { get; set; }
    }
}
