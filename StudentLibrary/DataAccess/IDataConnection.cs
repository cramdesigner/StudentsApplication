using StudentLibrary.Model;
using System.Collections.Generic;

namespace StudentLibrary.DataAccess
{
    interface IDataConnection
    {
        List<StudentModel> GetStudents();
        void CreateStudent(StudentModel studentModel);
        void UpdateStudent(StudentModel studentModel);
        void DeleteStudent(int id);
    }
}
