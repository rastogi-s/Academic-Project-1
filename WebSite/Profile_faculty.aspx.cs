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

       
        if (Session["user_id"]== null)
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
            SqlCommand cmd = new SqlCommand("faculty_view", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@faculty_id", SqlDbType.VarChar).Value = str;
            SqlDataReader reader;
            reader = cmd.ExecuteReader();
            if (reader.HasRows)
            {
                reader.Read();
                Img1.Src = "Uploads/Faculty/" + reader.GetValue(15).ToString();
                TextBox1.Text = reader.GetValue(3).ToString();
                TextBox2.Text = reader.GetValue(14).ToString();
                TextBox3.Text = reader.GetValue(2).ToString();
                if(!reader.GetValue(7).ToString().Equals(""))
                    TextBox30.Text=reader.GetValue(7).ToString().Remove(reader.GetValue(7).ToString().IndexOf(' '));
                if (reader.GetValue(10).ToString().ToUpper().Equals("M"))
                    RadioButton1.Checked = true;
                else
                    RadioButton2.Checked = true;
                TextArea1.InnerText = reader.GetValue(4).ToString();
                TextBox7.Text = reader.GetValue(5).ToString();
                TextBox8.Text = reader.GetValue(11).ToString();
                if (!reader.GetValue(12).ToString().Equals(""))
                {
                    TextBox9.Text = reader.GetValue(12).ToString().Remove(reader.GetValue(12).ToString().IndexOf("-"));
                    TextBox10.Text = reader.GetValue(12).ToString().Substring(reader.GetValue(12).ToString().IndexOf("-") + 1);
                }
                TextBox11.Text = reader.GetValue(6).ToString();
                TextBox12.Text = reader.GetValue(9).ToString();
                TextBox33.Text = reader.GetValue(8).ToString();
                if (!reader.GetValue(13).ToString().Equals(""))
                    TextBox31.Text = reader.GetValue(13).ToString().Remove(reader.GetValue(13).ToString().IndexOf(' '));
                TextBox32.Text = reader.GetValue(16).ToString();
            }
            conn.Close();
        }
    }
}