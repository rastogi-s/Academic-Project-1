using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Configuration;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user_id"] == null)
        {
            Response.Redirect("Login.aspx");
        }
        if (!IsPostBack)
        {

            String str = Session["user_id"].ToString();
            String connString = ConfigurationManager.ConnectionStrings["school_management_systemConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = connString;
            conn.Open();
            SqlCommand cmd = new SqlCommand("Select last_name,first_name,middle_name,sex,dob,image_url,dept_id from staff_table where staff_id='" + str + "'", conn);
            SqlDataReader reader;
            reader = cmd.ExecuteReader();
            reader.Read();
            if (reader.HasRows)
            {

                int x;
                string st1 = "", sm1 = "", st2 = "", sm2 = "", st3 = "", sm3 = "";
                if (!reader.GetValue(0).ToString().Equals(""))
                {

                    st1 = reader.GetValue(0).ToString().ElementAt(0).ToString().ToUpper();
                    x = reader.GetValue(0).ToString().Length;
                    sm1 = st1 + reader.GetValue(0).ToString().Substring(1, x - 1);
                }
                if (!reader.GetValue(1).ToString().Equals(""))
                {
                    st2 = reader.GetValue(1).ToString().ElementAt(0).ToString().ToUpper();
                    x = reader.GetValue(1).ToString().Length;
                    sm2 = st2 + reader.GetValue(1).ToString().Substring(1, x - 1);
                }
                if (!reader.GetValue(2).ToString().Equals(""))
                {
                    st3 = reader.GetValue(2).ToString().ElementAt(0).ToString().ToUpper();
                    x = reader.GetValue(2).ToString().Length;
                    sm3 = st3 + reader.GetValue(2).ToString().Substring(1, x - 1);
                }
                Label2.Text = sm2 + " " + sm3 + " " + sm1;
                if (reader.GetValue(3).ToString().Equals("m"))
                {

                    Label7.Text = " Male";
                }
                else
                {

                    Label7.Text = " Female";
                }
                string[] f1 = reader.GetValue(4).ToString().Split(' ');
                Label6.Text = f1[0];
                string st5 = reader.GetValue(6).ToString();
                Image1.ImageUrl = "~/Uploads/Staff/" + reader.GetValue(5).ToString();
                // MessageBox.Show(Server.MapPath(reader.GetValue(5).ToString()));
                reader.Close();
                SqlCommand cmd2 = new SqlCommand("Select dept_name from department where dept_id='" + st5 + "'", conn);
                SqlDataReader reader1;
                reader1 = cmd2.ExecuteReader();
                reader1.Read();
                if (reader1.HasRows)
                {
                    Label8.Text = reader1.GetValue(0).ToString();
                }
            }

            conn.Close();
        }

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("FacultyRegistration.aspx");
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("FacultyProfUpdate.aspx");
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        Response.Redirect("Class_allotment.aspx");
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        Response.Redirect("Faculty_course_allotment.aspx");
    }
}