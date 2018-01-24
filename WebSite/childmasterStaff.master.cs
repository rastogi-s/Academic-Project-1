using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

public partial class MasterPage2 : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void HyperLink1_Click(object sender, EventArgs e)
    {
        Response.Redirect("profile_staff.aspx");
    }
    protected void LinkButton12_Click(object sender, EventArgs e)
    {
        Response.Redirect("ResetPassStaff.aspx");
    }
    protected void HyperLink2_Click(object sender, EventArgs e)
    {
        Response.Redirect("StaffUpdateApply.aspx");
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        string user_id=Session["user_id"].ToString() ;
        string connString = ConfigurationManager.ConnectionStrings["school_management_systemConnectionString"].ConnectionString;
        SqlConnection conn = new SqlConnection();
        conn.ConnectionString = connString;
        conn.Open();
        SqlCommand cmd = new SqlCommand("select * from users where user_id=@userid", conn);
        cmd.Parameters.AddWithValue("@userid", user_id);
  
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            int x = dt.Columns.IndexOf("role_id");
            DataTableReader dr = new DataTableReader(dt);
            dr.Read();
            string role_id = dr.GetValue(x).ToString();
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

       // Response.Redirect("Staff_homepage.aspx");
    }
}
