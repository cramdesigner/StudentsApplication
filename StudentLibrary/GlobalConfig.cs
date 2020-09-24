using StudentLibrary.DataAccess;
using System;
using System.Configuration;

namespace StudentLibrary
{
    public static class GlobalConfig
    {
        public static SqlConnector Connection { get; set; }

        public static void InitializeConnection()
        {
            Connection = new SqlConnector();
        }

        public static String CnnString(String name)
        {
            return ConfigurationManager.ConnectionStrings[name].ConnectionString;
        }
    }
}
