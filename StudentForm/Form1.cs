using StudentLibrary;
using StudentLibrary.Model;
using System;
using System.Collections.Generic;
using System.Windows.Forms;

namespace StudentForm
{
    public partial class Form1 : Form
    {

        int id;

        public Form1()
        {
            InitializeComponent();
        }
        
        private void Form1_Load(object sender, EventArgs e)
        {
            GetStudents();
        }

        private void GetStudents()
        {
            txtBoxStudentId.Focus();
            
            List<StudentModel> list = GlobalConfig.Connection.GetStudents();
            dataGridStudents.DataSource = list;
            dataGridStudents.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            if(dataGridStudents.Rows.Count > 0)
            {
                dataGridStudents.Rows[0].Selected = false;
            }
        }

        private void ClearData()
        {
            txtBoxStudentId.Text = "";
            txtBoxLastName.Text = "";
            txtBoxFirstName.Text = "";
            txtBoxMiddleName.Text = "";
            txtBoxCourse.Text = "";
            id = 0;
        }



        private void dataGridStudents_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            id = Convert.ToInt32(dataGridStudents.SelectedRows[0].Cells[0].Value);
            txtBoxStudentId.Text = dataGridStudents.SelectedRows[0].Cells[1].Value.ToString();
            txtBoxFirstName.Text = dataGridStudents.SelectedRows[0].Cells[2].Value.ToString();
            txtBoxLastName.Text = dataGridStudents.SelectedRows[0].Cells[3].Value.ToString();
            txtBoxMiddleName.Text = dataGridStudents.SelectedRows[0].Cells[4].Value.ToString();
            txtBoxCourse.Text = dataGridStudents.SelectedRows[0].Cells[5].Value.ToString();
        }

        private void btnAdd_Click(object sender, EventArgs e)
        {
            if (id==0)
            {
                if (isValid())
                {
                    StudentModel studentModel = new StudentModel
                    {
                        StudentId = txtBoxStudentId.Text.ToUpper(),
                        LastName = txtBoxLastName.Text,
                        FirstName = txtBoxFirstName.Text,
                        MiddleName = txtBoxMiddleName.Text,
                        Course = txtBoxCourse.Text
                    };

                    GlobalConfig.Connection.CreateStudent(studentModel);
                    MessageBox.Show("Student Added Successfully", "Success", MessageBoxButtons.OK, MessageBoxIcon.Information);

                    GetStudents();
                    ClearData();
                }
                else
                {
                    MessageBox.Show("Please fill in all the the required details", "Form Input", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
            else
            {
                MessageBox.Show("Please click reset button", "Form Input", MessageBoxButtons.OK, MessageBoxIcon.Error);

            }
        }

        private void btnUpdate_Click(object sender, EventArgs e)
        {
            if (id>0)
            {
                if (isValid())
                {
                    StudentModel studentModel = new StudentModel
                    {
                        Id = id,
                        StudentId = txtBoxStudentId.Text.ToUpper(),
                        LastName = txtBoxLastName.Text,
                        FirstName = txtBoxFirstName.Text,
                        MiddleName = txtBoxMiddleName.Text,
                        Course = txtBoxCourse.Text
                    };

                    GlobalConfig.Connection.UpdateStudent(studentModel);
                    MessageBox.Show("Student Data Updated Successfully", "Success", MessageBoxButtons.OK, MessageBoxIcon.Information);

                    GetStudents();
                    ClearData();
                }
                else
                {
                    MessageBox.Show("Please fill in all the the required details", "Form Input", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
            else
            {
                MessageBox.Show("Please select student data to update", "Form Input", MessageBoxButtons.OK, MessageBoxIcon.Error);

            }
        }

        private void btnDelete_Click(object sender, EventArgs e)
        {
            if (id > 0)
            {
                DialogResult result = MessageBox.Show("Do you really want to delete this data?", "Delete", MessageBoxButtons.YesNo, MessageBoxIcon.Information);
                if (result == DialogResult.Yes)
                {
                    GlobalConfig.Connection.DeleteStudent(id);

                    MessageBox.Show("Record Deleted Successfully", "Success", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    GetStudents();
                    ClearData();
                }
            }
            else
            {
                MessageBox.Show("Please select student data to delete", "Form Input", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void btnReset_Click(object sender, EventArgs e)
        {
            GetStudents();
            ClearData();
        }

        private bool isValid()
        {
            if (txtBoxStudentId.Text == string.Empty)
            {
                return false;
            }
            if (txtBoxFirstName.Text == string.Empty)
            {
                return false;
            }
            if (txtBoxLastName.Text == string.Empty)
            {
                return false;
            }
            if (txtBoxCourse.Text == string.Empty)
            {
                return false;
            }
            return true;
        }
    }
}
