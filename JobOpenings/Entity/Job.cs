using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace JobOpenings.Entity
{
    public class Job
    {
        [Key]
        public int Id { get; set; }
        [Required]
        [StringLength(100)]
        public string? Title { get; set; }
        [Required]
        public string? Description { get; set; }
        [Column(TypeName = "datetime2")]
        public DateTime PostedDate { get; set; }
        [Column(TypeName = "datetime2")]
        public DateTime ClosingDate { get; set; }
        [ForeignKey("Location")]
        public int LocationId { get; set; }
        public Location? Location { get; set; }
        [ForeignKey("Department")]
        public int DepartmentId { get; set; }
        public Department? Department { get; set; }
    }
}
