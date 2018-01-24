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
    protected void Button1_Click(object sender, EventArgs e)
    {
        String connString = ConfigurationManager.ConnectionStrings["school_management_systemConnectionString"].ConnectionString;
        SqlConnection conn = new SqlConnection();
        conn.ConnectionString = connString;
        conn.Open();
        int a = 0;
        SqlCommand cmd = new SqlCommand("add_class_sec", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        if (TextBox1.Text.ToUpper().Equals("LKG"))
            a = -1;
        else if (TextBox1.Text.ToUpper().Equals("UKG"))
            a = 0;
        else 
            a = Convert.ToInt32(TextBox1.Text);
        cmd.Parameters.Add("@class", SqlDbType.Int).Value =a;
        cmd.Parameters.Add("@section", SqlDbType.VarChar).Value = TextBox2.Text.ToString().ToUpper();
        SqlDataReader reader;
        reader = cmd.ExecuteReader();
        if (reader.HasRows)
        {
            clearallcontrols(Page);
            ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language$='text/javascript' src$='~/js/JScript'>alert('Already present.')</script>");

        }
        else
        {
            clearallcontrols(Page);
            ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language$='text/javascript' src$='~/js/JScript'>alert('Successfully added.')</script>");
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