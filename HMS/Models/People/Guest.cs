using System.Net.Mail;
using System.Security.Cryptography;

namespace HMS.Models.Users
{
    public class Guest : User
    {
        public string? GuestType { get; set; }    
        private int GuestId { get; set; }

        // a Guest have a visibility to its own Bookings 
        //Add Constructor 
    }
}
