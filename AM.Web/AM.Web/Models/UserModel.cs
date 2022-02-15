namespace AM.Web.Models
{
    public class UserModel
    {
        public string Id { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public bool Active { get; set; }
        public string FullName { get { return (FirstName + " " + LastName).Trim(); } }
    }
}
