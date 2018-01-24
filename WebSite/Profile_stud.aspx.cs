using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;
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
            string connString = ConfigurationManager.ConnectionStrings["school_management_systemConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = connString;
            conn.Open();
            SqlCommand cmd = new SqlCommand("student_view", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@reg_no", SqlDbType.VarChar).Value = str;
            cmd.Parameters.Add("@acad_year", SqlDbType.VarChar).Value = DateTime.Now.Year;
            SqlDataReader reader;
            reader = cmd.ExecuteReader();
            if (reader.HasRows)
            {
                reader.Read();
                Img1.Src = "Uploads/Student/" + reader.GetValue(14).ToString();
                TextBox1.Text = reader.GetValue(3).ToString();
                TextBox2.Text = reader.GetValue(13).ToString();
                TextBox3.Text = reader.GetValue(2).ToString();
                TextBox30.Text = reader.GetValue(7).ToString().Remove(reader.GetValue(7).ToString().IndexOf(' '));
                TextArea1.InnerText = reader.GetValue(4).ToString();
                TextBox7.Text = reader.GetValue(5).ToString();
                TextBox8.Text = reader.GetValue(11).ToString();
                if (reader.GetValue(10).ToString().ToUpper().Equals("M"))
                    RadioButton1.Checked = true;
                else
                    RadioButton2.Checked = true;
                TextBox11.Text = reader.GetValue(6).ToString();
                TextBox12.Text = reader.GetValue(9).ToString();
                TextBox34.Text = reader.GetValue(8).ToString().ToUpper();
                TextBox4.Text = reader.GetValue(19).ToString();
                TextBox5.Text = reader.GetValue(29).ToString();
                TextBox6.Text = reader.GetValue(18).ToString();
                TextBox18.Text = reader.GetValue(23).ToString().Remove(reader.GetValue(23).ToString().IndexOf(' '));
                if (!reader.GetValue(12).ToString().Equals(""))
                {
                    TextBox9.Text = reader.GetValue(12).ToString().Remove(reader.GetValue(12).ToString().IndexOf("-"));
                    TextBox10.Text = reader.GetValue(12).ToString().Substring(reader.GetValue(12).ToString().IndexOf("-") + 1);
                }
                if (reader.GetValue(26).ToString().ToUpper().Equals("M"))
                    RadioButton3.Checked = true;
                else
                    RadioButton4.Checked = true;
                TextArea4.InnerText = reader.GetValue(20).ToString();
                TextBox13.Text = reader.GetValue(21).ToString();
                TextBox14.Text = reader.GetValue(27).ToString();
                if (!reader.GetValue(28).ToString().Equals(""))
                {
                    TextBox15.Text = reader.GetValue(28).ToString().Remove(reader.GetValue(28).ToString().IndexOf("-"));
                    TextBox16.Text = reader.GetValue(28).ToString().Substring(reader.GetValue(28).ToString().IndexOf("-") + 1);
                }
                TextBox17.Text = reader.GetValue(22).ToString();
                TextBox35.Text = reader.GetValue(24).ToString();
                TextBox29.Text = reader.GetValue(16).ToString();
                TextBox37.Text = reader.GetValue(15).ToString().Remove(reader.GetValue(15).ToString().IndexOf(' '));
            }
            reader.NextResult();
            if (reader.HasRows)
            {
                reader.Read();
                TextBox26.Text = "ST1";
                TextBox32.Text = reader.GetValue(0).ToString();
                TextBox33.Text = reader.GetValue(1).ToString();
                TextBox36.Text = reader.GetValue(2).ToString();
            }
            reader.NextResult();
            if (reader.HasRows)
            {
                ListItemCollection list = new ListItemCollection();
                while (reader.Read())
                {
                    ListItem l = new ListItem(reader.GetValue(4).ToString(), reader.GetValue(5).ToString());
                    l.Value = l.Value.ToString() + "," + reader.GetValue(1).ToString() + " " + reader.GetValue(2).ToString() + " " +
                            reader.GetValue(0).ToString();
                    DropDownList7.Items.Add(l);

                }

                TextBox31.Text = DropDownList7.SelectedItem.Value.ToString().Remove(DropDownList7.SelectedItem.Value.ToString().IndexOf(","));
                TextBox28.Text = DropDownList7.SelectedItem.Value.ToString().Substring(DropDownList7.SelectedItem.Value.ToString().IndexOf(",") + 1);
                conn.Close();
            }
        }
        
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 1;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 0;
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 2;
    }
    protected void DropDownList7_SelectedIndexChanged(object sender, EventArgs e)
    {
        TextBox31.Text = DropDownList7.SelectedItem.Value.ToString().Remove(DropDownList7.SelectedItem.Value.ToString().IndexOf(","));
        TextBox28.Text = DropDownList7.SelectedItem.Value.ToString().Substring(DropDownList7.SelectedItem.Value.ToString().IndexOf(",") + 1);
    }
}