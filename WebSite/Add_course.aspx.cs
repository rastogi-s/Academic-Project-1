using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

public partial class Default2 : System.Web.UI.Page
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
        SqlCommand cmd = new SqlCommand("select course_name from courses where course_id='" + TextBox1.Text.ToString()
          + "'",conn);
        SqlDataReader reader=cmd.ExecuteReader();
        if (reader.HasRows)
        {
            reader.Read();
            TextBox2.Text = reader.GetValue(0).ToString();
        }
        reader.Close();
        conn.Close();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        String connString = ConfigurationManager.ConnectionStrings["school_management_systemConnectionString"].ConnectionString;
        SqlConnection conn = new SqlConnection();
        conn.ConnectionString = connString;
        conn.Open();
        SqlCommand cmd = new SqlCommand("add_course", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        
        cmd.Parameters.Add("@course_id", SqlDbType.VarChar).Value = TextBox1.Text.ToString();
        
        cmd.Parameters.Add("@course_name", SqlDbType.VarChar).Value = TextBox2.Text.ToString();
        
        int x = cmd.ExecuteNonQuery();
        if (x > 0)
        {
            clearallcontrols(Page);
            ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language$='text/javascript' src$='~/js/JScript'>alert('Successfully Added.')</script>");

        }
        else
        {
            ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language$='text/javascript' src$='~/js/JScript'>alert('Error!!')</script>");
        }
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
}