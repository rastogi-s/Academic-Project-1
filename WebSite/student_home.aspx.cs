using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data.Sql;
using System.Windows.Forms;
using System.Configuration;

public partial class Default2 : System.Web.UI.Page
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
            string connString = ConfigurationManager.ConnectionStrings["school_management_systemConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = connString;
            conn.Open();
            SqlCommand cmd = new SqlCommand("Select last_name,first_name,middle_name,sex,dob,image_url from student_table where reg_no='" + str+"'", conn);
            SqlDataReader reader;
            reader = cmd.ExecuteReader();
            if (reader.HasRows)
            {
                reader.Read();
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
                Label2.Text = sm2 + " " + sm3 + " " +sm1 ;
                if (reader.GetValue(3).ToString().Equals("m") || reader.GetValue(3).ToString().Equals("M"))
                {

                    Label7.Text = " Male";
                }
                else
                {

                    Label7.Text = " Female";
                }
                string[] f1 = reader.GetValue(4).ToString().Split(' ');
                Label6.Text = f1[0];
                Label8.Text = str;
                image1.ImageUrl = "~/Uploads/Student/" + reader.GetValue(5).ToString();
               
            }
            
            conn.Close();
        }
        
    }
}