namespace HMS.Models.Users
{
    public class Employee : User
    {
        public string? GuestType { get; set; }
        public int? EmployeeId { get; set; }
        public string position { get; set; }
        public DateTime HireDate { get; set; }
    }
}
