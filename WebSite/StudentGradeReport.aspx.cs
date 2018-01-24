using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class Default4 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user_id"] == null)
        {
            Response.Redirect("Login.aspx");
        }

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
              string user_id=Session["user_id"].ToString();
              string year=DropDownList1.SelectedItem.ToString();
              string term=DropDownList2.SelectedItem.ToString();
              string connString = ConfigurationManager.ConnectionStrings["school_management_systemConnectionString"].ConnectionString;
              SqlConnection conn = new SqlConnection();
              conn.ConnectionString = connString;
              conn.Open();
              SqlCommand cmd = new SqlCommand("student_grade_view", conn);
              cmd.CommandType = CommandType.StoredProcedure;
              cmd.Parameters.Add("@reg_no", SqlDbType.VarChar).Value =user_id;
              cmd.Parameters.Add("@acad_year", SqlDbType.Int).Value =year;
              cmd.Parameters.Add("@term_desc", SqlDbType.VarChar).Value =term;
              SqlDataReader reader;
              reader = cmd.ExecuteReader();
              if (reader.HasRows)
              {
                  reader.Read();
                  string st1 = "", sm1 = "", st2 = "", sm2 = "", st3 = "", sm3 = "";
                  int x;
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
                  TextBox2.Text = sm1;
                  TextBox3.Text = sm3;
                  TextBox4.Text = sm2;
                  TextBox5.Text = reader.GetValue(3).ToString();
                  TextBox6.Text = reader.GetValue(4).ToString();
                  TextBox7.Text = reader.GetValue(5).ToString();
                  TextBox8.Text = user_id;
                  reader.NextResult();
                  GridView1.DataSource = reader;
                  GridView1.DataBind();
     
                  MultiView1.ActiveViewIndex = 0;
                  GridView1.Visible = true;

              }

    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridView1.Visible = false;
    }
    
}