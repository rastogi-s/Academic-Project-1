using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user_id"] == null)
            Response.Redirect("Login.aspx");
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        String user_id = Session["user_id"].ToString();
        String connString = ConfigurationManager.ConnectionStrings["school_management_systemConnectionString"].ConnectionString;
        SqlConnection conn = new SqlConnection();
        conn.ConnectionString = connString;
        conn.Open();
        SqlCommand cmd = new SqlCommand("select password_ from users where user_id='" + user_id + "'", conn);
        SqlDataReader reader = cmd.ExecuteReader();
        if (reader.Read())
        {
            if (TextBox1.Text.Equals(reader.GetValue(0).ToString()))
            {
                reader.Close();
                cmd = new SqlCommand("update users set password_='" + TextBox3.Text + "' where user_id='" + user_id + "'", conn);
                cmd.ExecuteNonQuery();
                ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language$='text/javascript' src$='~/js/JScript'>alert('Password has been successfully changed')</script>");
                clearallcontrols(Page);
            }
            else
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language$='text/javascript' src$='~/js/JScript'>alert('Wrong old password entered')</script>");
                clearallcontrols(Page);
            }

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