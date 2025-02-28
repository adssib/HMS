using System.Net.Mail;
using System.Security.Cryptography;

namespace HMS.Models.Users
{
    public abstract class User
    {
        public int Id { get; protected set; }
        public string? FirstName { get; set; }
        public string? LastName { get; set; }
        public MailAddress? Email { get; set; }
        public string Phone { get; set; }
        protected string? PasswordHash { get; set; }
        protected string? PasswordSalt { get; set; }

        public void SetPassword(string password)
        {
            PasswordSalt = GenerateSalt();
            PasswordHash = HashPassword(password, PasswordSalt);
        }

        public bool VerifyPassword(string password)
        {
            return HashPassword(password, PasswordSalt) == PasswordHash;
        }

        private string GenerateSalt(int size = 16)
        {
            byte[] saltBytes = RandomNumberGenerator.GetBytes(size);
            return Convert.ToBase64String(saltBytes);
        }

        private string HashPassword(string password, string salt)
        {
            byte[] saltBytes = Convert.FromBase64String(salt);
            byte[] passwordBytes = System.Text.Encoding.UTF8.GetBytes(password);

            using (var rfc2898DeriveBytes = new Rfc2898DeriveBytes(passwordBytes, saltBytes, 10000, HashAlgorithmName.SHA256))
            {
                return Convert.ToBase64String(rfc2898DeriveBytes.GetBytes(32));
            }
        }
    }
}
