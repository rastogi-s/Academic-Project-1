using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class Default4 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user_id"] == null)
            Response.Redirect("Login.aspx");
        if (!IsPostBack)
        {

             string year;
             if (DateTime.Now.Month <= 3)
             {
                        year = (Convert.ToInt16(DateTime.Now.Year) - 1).ToString();
             }
              else
             {

                       year = DateTime.Now.Year.ToString();

             }
        
        string connString = ConfigurationManager.ConnectionStrings["school_management_systemConnectionString"].ConnectionString;
        SqlConnection conn = new SqlConnection();
        conn.ConnectionString = connString;
        conn.Open();
        SqlCommand cmd = new SqlCommand("students_details_attendance_page", conn);
        cmd.CommandType = CommandType.StoredProcedure;
              cmd.Parameters.Add("@reg_no", SqlDbType.VarChar).Value =Session["user_id"].ToString();
              cmd.Parameters.Add("@acad_year", SqlDbType.Int).Value =year;
              SqlDataReader reader;
              reader = cmd.ExecuteReader();
              if (reader.HasRows)
              {
                  reader.Read();
                  TextBox2.Text = reader.GetValue(2).ToString();
                  TextBox3.Text = reader.GetValue(3).ToString();
                  TextBox4.Text = reader.GetValue(4).ToString();
                  TextBox5.Text = reader.GetValue(5).ToString();
                  TextBox6.Text = reader.GetValue(6).ToString();
                  TextBox7.Text = reader.GetValue(1).ToString();
                  TextBox8.Text = Session["user_id"].ToString();

              }
              
              reader.Close();
              conn.Close();
             
              
        }
        
       
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        GridView1.Visible = true;
    }

   
}