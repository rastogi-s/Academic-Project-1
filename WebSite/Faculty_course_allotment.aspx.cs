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
    int classno;
    protected void Page_Load(object sender, EventArgs e)
    {
        /*if (Session["user_id"] == null)
            Response.Redirect("Login.aspx");*/
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        DropDownList1.Items.Clear();
        DropDownList1.Items.Add("Select Course");
        String connString = ConfigurationManager.ConnectionStrings["school_management_systemConnectionString"].ConnectionString;
        SqlConnection conn = new SqlConnection();
        conn.ConnectionString = connString;
        conn.Open();
        if (TextBox5.Text.ToUpper().Equals("LKG"))
            classno = -1;
        else if (TextBox5.Text.ToUpper().Equals("UKG"))
            classno = 0;
        else
            classno = Convert.ToInt32(TextBox5.Text);
        SqlCommand cmd = new SqlCommand("select course_name,course_id from courses where course_id in (select course_id from class_course where class=" + classno + " and section='" + TextBox6.Text + "')", conn);
        SqlDataReader reader = cmd.ExecuteReader();
        while (reader.Read())
        {
            DropDownList1.Items.Add(reader.GetValue(0).ToString()+" "+reader.GetValue(1));
        }
        reader.Close();
        conn.Close();
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        int year;
        if (DateTime.Now.Month < 3)
            year = DateTime.Now.Year - 1;
        else
            year = DateTime.Now.Year;
        String connString = ConfigurationManager.ConnectionStrings["school_management_systemConnectionString"].ConnectionString;
        SqlConnection conn = new SqlConnection();
        conn.ConnectionString = connString;
        conn.Open();
        SqlCommand cmd = new SqlCommand("assign_faculty_course", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@faculty_id", SqlDbType.VarChar).Value = TextBox7.Text;
        if(TextBox5.Text.ToUpper().Equals("LKG"))
            classno=-1;
        else if (TextBox5.Text.ToUpper().Equals("UKG"))
            classno = 0;
        else
            classno = Convert.ToInt32(TextBox5.Text);
        cmd.Parameters.Add("@class", SqlDbType.Int).Value = classno;
        cmd.Parameters.Add("@section", SqlDbType.VarChar).Value = TextBox6.Text.ToUpper();
        cmd.Parameters.Add("@acad_year", SqlDbType.Int).Value = year;
        cmd.Parameters.Add("@course_id", SqlDbType.VarChar).Value = DropDownList1.SelectedItem.ToString().Substring(DropDownList1.SelectedItem.ToString().LastIndexOf(' ')+1);
        int x=cmd.ExecuteNonQuery();
        if (x > 0)
        {
            ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language$='text/javascript' src$='~/js/JScript'>alert('Update Successful')</script>");
        }
        else
            ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language$='text/javascript' src$='~/js/JScript'>alert('Update failed')</script>");
        conn.Close();
    }
}