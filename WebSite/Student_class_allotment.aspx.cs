using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {
        String connString = ConfigurationManager.ConnectionStrings["school_management_systemConnectionString"].ConnectionString;
        SqlConnection conn = new SqlConnection();
        conn.ConnectionString = connString;
        conn.Open();
        SqlCommand cmd = new SqlCommand("student_class_view", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@reg_no", SqlDbType.VarChar).Value = TextBox1.Text.ToString();
        SqlDataReader reader;
        reader = cmd.ExecuteReader();
        if (reader.HasRows)
        {
            reader.Read();
           TextBox2.Text = reader.GetValue(0).ToString();
            TextBox4.Text = reader.GetValue(1).ToString();
            TextBox5.Text = reader.GetValue(2).ToString();
            TextBox3.Text = reader.GetValue(3).ToString();
            disableallcontrols(Page, false);
            Button1.Enabled = false;
        }
        else
        {
            //clearallcontrols(Page);
            reader.Close();
            cmd = new SqlCommand("select last_name,middle_name,first_name from student_table where reg_no='"
                + TextBox1.Text.ToString() + "'", conn);
            reader = cmd.ExecuteReader();
            if (reader.Read()) 
                TextBox2.Text = reader.GetValue(2).ToString() + " " + reader.GetValue(1).ToString() + " " + reader.GetValue(0).ToString();
            Button1.Enabled = true;
            disableallcontrols(Page, true);
            
        }
        reader.Close();
        conn.Close();
    }
    protected void disableallcontrols(Control parent, bool state)
    {
        foreach (Control c in parent.Controls)
        {
            if (c is TextBox)
                ((TextBox)(c)).Enabled = state;
            disableallcontrols(c, state);
        }
        TextBox1.Enabled = true;
    }
    protected void clearallcontrols(Control parent)
    {
        foreach (Control c in parent.Controls)
        {
            if (c is TextBox)
                ((TextBox)(c)).Text = "";
            clearallcontrols(c);
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        String connString = ConfigurationManager.ConnectionStrings["school_management_systemConnectionString"].ConnectionString;
        SqlConnection conn = new SqlConnection();
        conn.ConnectionString = connString;
        conn.Open();
        int a = 0;
        SqlCommand cmd = new SqlCommand("student_class_allotment", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        if (TextBox4.Text.ToUpper().Equals("LKG"))
            a = -1;
        else if (TextBox4.Text.ToUpper().Equals("UKG"))
            a = 0;
        else
            a = Convert.ToInt32(TextBox4.Text);
        cmd.Parameters.Add("@class", SqlDbType.Int).Value = a;
        cmd.Parameters.Add("@section", SqlDbType.VarChar).Value = TextBox5.Text.ToString().ToUpper();
        cmd.Parameters.Add("@acad_year", SqlDbType.Int).Value = Convert.ToInt32(DateTime.Now.Year);
        cmd.Parameters.Add("@reg_no", SqlDbType.VarChar).Value = TextBox1.Text.ToString();
        cmd.Parameters.Add("@roll_no", SqlDbType.Int).Value = Convert.ToInt32(TextBox3.Text);
        int x = cmd.ExecuteNonQuery();
        if (x > 0)
        {
            clearallcontrols(Page);
            ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language$='text/javascript' src$='~/js/JScript'>alert('Update Successfull')</script>");

        }
        else
        {
            ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language$='text/javascript' src$='~/js/JScript'>alert('Error not updated')</script>");
        }
    }
}