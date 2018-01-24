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
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        String connString = ConfigurationManager.ConnectionStrings["school_management_systemConnectionString"].ConnectionString;
        SqlConnection conn = new SqlConnection();
        conn.ConnectionString = connString;
        conn.Open();
        SqlCommand cmd = new SqlCommand("select ft.last_name,ft.middle_name,ft.first_name,cf.class,cf.section from faculty_table as ft,class_faculty as cf where cf.faculty_id='" +
            DropDownList1.SelectedItem.ToString() + "'" + "and acad_year=" + DateTime.Now.Year + "and cf.faculty_id=ft.faculty_id",conn);
        SqlDataReader reader=cmd.ExecuteReader();
        if (reader.HasRows)
        {
            reader.Read();
            TextBox1.Text = reader.GetValue(2).ToString() +" "+ reader.GetValue(1).ToString()+" " + reader.GetValue(0).ToString();
            TextBox2.Text = reader.GetValue(3).ToString();
            TextBox4.Text = reader.GetValue(4).ToString();
            disableallcontrols(Page, false);
            Button1.Enabled = false;
        }
        else
        {
            clearallcontrols(Page);
            reader.Close();
            cmd = new SqlCommand("select last_name,middle_name,first_name from faculty_table where faculty_id='"
                + DropDownList1.SelectedItem.ToString() + "'",conn);
            reader = cmd.ExecuteReader();
            if (reader.Read())
                TextBox1.Text = reader.GetValue(2).ToString() + " " + reader.GetValue(1).ToString() + " " + reader.GetValue(0).ToString();
                Button1.Enabled = true;
                disableallcontrols(Page, true);
            
        }
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
    }
    protected void clearallcontrols(Control parent)
    {
        foreach (Control c in parent.Controls)
        {
            if (c is TextBox)
                ((TextBox)(c)).Text ="" ;
            clearallcontrols(c);
        }
    }
    protected void ddl_databound(object sender, EventArgs e)
    {
        DropDownList1.Items.Insert(0, "Faculty Id");
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        String connString = ConfigurationManager.ConnectionStrings["school_management_systemConnectionString"].ConnectionString;
        SqlConnection conn = new SqlConnection();
        conn.ConnectionString = connString;
        conn.Open();
        SqlCommand cmd = new SqlCommand("class_allotment", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@class", SqlDbType.Int).Value = Convert.ToInt32(TextBox2.Text);
        cmd.Parameters.Add("@section", SqlDbType.VarChar).Value = TextBox4.Text.ToString().ToUpper();
        cmd.Parameters.Add("@acad_year", SqlDbType.Int).Value = Convert.ToInt32(DateTime.Now.Year);
        cmd.Parameters.Add("@faculty_id", SqlDbType.VarChar).Value = DropDownList1.SelectedItem.Text;
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