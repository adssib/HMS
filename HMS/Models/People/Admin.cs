namespace HMS.Models.Users
{
    public class Admin : Employee
    {
        public string? GuestType { get; set; }
        public int? AdminId { get; set; }

    }
}
