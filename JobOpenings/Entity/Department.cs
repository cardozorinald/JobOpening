using System.ComponentModel.DataAnnotations;

namespace JobOpenings.Entity
{
    public class Department
    {
        [Key]
        public int Id { get; set; }
        [Required]
        [StringLength(100)]
        public string? Title { get; set; }
    }
}
