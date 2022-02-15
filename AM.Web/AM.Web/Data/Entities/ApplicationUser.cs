﻿using Microsoft.AspNetCore.Identity;

namespace AM.Web.Data.Entities
{
    public class ApplicationUser : IdentityUser
    {
        public ApplicationUser() { Active = true; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public bool Active { get; set; }
       
    }
}
