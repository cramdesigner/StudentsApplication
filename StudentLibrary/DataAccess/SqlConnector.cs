using Dapper;
using StudentLibrary.Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;

namespace StudentLibrary.DataAccess
{
    public class SqlConnector : IDataConnection
    {
        private const String DB = "StudentsDB";
        public void CreateStudent(StudentModel studentModel)
        {
            using (IDbConnection connection = new SqlConnection(GlobalConfig.CnnString(DB)))
            {
                var p = new DynamicParameters();
                p.Add("@StudentId", studentModel.StudentId);
                p.Add("@LastName", studentModel.LastName);
                p.Add("@FirstName", studentModel.FirstName);
                p.Add("@MiddleName", studentModel.MiddleName);
                p.Add("@Course", studentModel.Course);

                connection.Execute("[dbo].[spStudent_Insert]", p, commandType: CommandType.StoredProcedure);

            }
        }

        public void DeleteStudent(int id)
        {
            using (IDbConnection connection = new SqlConnection(GlobalConfig.CnnString(DB)))
            {
                var p = new DynamicParameters();
                p.Add("@Id", id);
                connection.Execute("[dbo].[spStudent_Delete]", p, commandType: CommandType.StoredProcedure);
            }
        }

        public List<StudentModel> GetStudents()
        {
            List<StudentModel> output;

            using (IDbConnection connection = new SqlConnection(GlobalConfig.CnnString(DB)))
            {
                output = connection.Query<StudentModel>("[dbo].[spStudents_GetAll]", new { }, commandType: CommandType.StoredProcedure).ToList();
            }

            return output;
        }

        public void UpdateStudent(StudentModel studentModel)
        {
            using (IDbConnection connection = new SqlConnection(GlobalConfig.CnnString(DB)))
            {
                var p = new DynamicParameters();
                p.Add("@Id", studentModel.Id);
                p.Add("@StudentId", studentModel.StudentId);
                p.Add("@LastName", studentModel.LastName);
                p.Add("@FirstName", studentModel.FirstName);
                p.Add("@MiddleName", studentModel.MiddleName);
                p.Add("@Course", studentModel.Course);

                connection.Execute("[dbo].[spStudent_Update]", p, commandType: CommandType.StoredProcedure);
            }
        }
    }
}
