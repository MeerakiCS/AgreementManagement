using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AM.Web.Models
{
    public class Response
    {
        public bool Success { get; set; }
        public string Message { get; set; }
        public string Type { get; set; }
        public string Exception { get; set; }
    }
    public static class ResponseType
    {
        public const string Success = "Success";
        public const string Error = "Error";
        public const string Warning = "Warning";
    }
}
