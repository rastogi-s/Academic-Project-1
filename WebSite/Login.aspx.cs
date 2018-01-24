using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
public partial class _Default : System.Web.UI.Page
{
  
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected void Button1_Click(object sender, EventArgs e)
    {

            string connString = ConfigurationManager.ConnectionStrings["school_management_systemConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = connString;
            conn.Open();
            SqlCommand cmd = new SqlCommand("select * from users where user_id=@userid and password_=@password", conn);
            cmd.Parameters.AddWithValue("@userid", TextBox1.Text);
            cmd.Parameters.AddWithValue("@password", TextBox2.Text);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                int x=dt.Columns.IndexOf("role_id");

                DataTableReader dr = new DataTableReader(dt);
                dr.Read();
                string role_id = dr.GetValue(x).ToString();
                string user_id = TextBox1.Text;
                Session["user_id"] = user_id;
                if (role_id.Equals("R1"))
                 Response.Redirect("student_home.aspx"); 
                if (role_id.Equals("R2"))
                    Response.Redirect("faculty_home.aspx");
                if (role_id.Equals("R3"))
                    Response.Redirect("StudentManager_homepage.aspx");
                if (role_id.Equals("R4"))
                    Response.Redirect("FacultyManager_homepage.aspx");
                if (role_id.Equals("R5"))
                    Response.Redirect("StaffManager_homepage.aspx");
                if (role_id.Equals("R6"))
                    Response.Redirect("Staff_homepage.aspx");
                if (role_id.Equals("R7"))
                    Response.Redirect("Exammanager_homepage.aspx");
            }
            else
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language$='text/javascript' src$='~/js/JScript'>alert('Invalid Username and Password')</script>");
            }

        
    }
    
   
}