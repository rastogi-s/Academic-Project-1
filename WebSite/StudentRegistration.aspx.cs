using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data.Sql;
using System.Data;
using System.Web.Security;
using System.Net.Mail;
using System.Net;
//using System.Windows.Forms;

public partial class Default3 : System.Web.UI.Page
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
        MultiView1.ActiveViewIndex = 1;
    }
    
    protected void Button4_Click1(object sender, EventArgs e)
    {

            HiddenField1.Value = TextBox1.Text; 
            String connString = ConfigurationManager.ConnectionStrings["school_management_systemConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = connString;
            conn.Open();
            SqlCommand cmd = new SqlCommand("studManager_application_view", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@app_no", SqlDbType.VarChar).Value = TextBox1.Text.ToString();
            SqlDataReader reader;
            reader = cmd.ExecuteReader();
            if (reader.HasRows)
            {
                reader.Read();
               // MessageBox.Show(reader.GetValue(17).ToString());
                if (!reader.GetValue(17).ToString().Equals(""))
                    Img1.Src = "Application_form_pic/" + reader.GetValue(17).ToString();
                else
                    Img1.Src = "";
                TextBox2.Text = reader.GetValue(2).ToString();
                TextBox3.Text = reader.GetValue(13).ToString();
                TextBox4.Text = reader.GetValue(1).ToString();
                if (!reader.GetValue(6).ToString().Equals(""))
                    TextBox30.Text = reader.GetValue(6).ToString().Remove(reader.GetValue(6).ToString().IndexOf(' '));
                if (reader.GetValue(9).ToString().ToUpper().Equals("M"))
                    RadioButton1.Checked = true;
                else
                    RadioButton2.Checked = true;
                TextArea1.InnerText = reader.GetValue(3).ToString();
                TextArea2.InnerText = reader.GetValue(3).ToString();
                TextBox7.Text = reader.GetValue(4).ToString();
                TextBox8.Text = reader.GetValue(10).ToString();
                if (!reader.GetValue(11).ToString().Equals(""))
                {
                    TextBox9.Text = reader.GetValue(11).ToString().Remove(reader.GetValue(11).ToString().IndexOf("-"));
                    TextBox10.Text = reader.GetValue(11).ToString().Substring(reader.GetValue(11).ToString().IndexOf("-") + 1);
                }
                TextBox11.Text = reader.GetValue(5).ToString();
                TextBox12.Text = reader.GetValue(8).ToString();
                TextBox31.Text = reader.GetValue(7).ToString();
                TextBox5.Text = reader.GetValue(14).ToString();
                TextBox6.Text = reader.GetValue(15).ToString();
                TextBox13.Text = reader.GetValue(16).ToString();
            }
            else
            {

                ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language$='text/javascript' src$='~/js/JScript'>alert('Already Registered')</script>");
                clearallcontrols(Page);
            }
        
            reader.Close();
            conn.Close();
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
         MultiView1.ActiveViewIndex = 0;
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        String connString = ConfigurationManager.ConnectionStrings["school_management_systemConnectionString"].ConnectionString;
        SqlConnection conn = new SqlConnection();
        conn.ConnectionString = connString;
        conn.Open();
        SqlCommand cmd = new SqlCommand("student_registration", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@last_name", SqlDbType.VarChar).Value = TextBox4.Text;
        cmd.Parameters.AddWithValue("@first_name", TextBox2.Text);
        cmd.Parameters.AddWithValue("@middle_name", TextBox3.Text);
        cmd.Parameters.AddWithValue("@s_address", TextArea1.InnerText);
        cmd.Parameters.AddWithValue("@postal_code", TextBox7.Text);
        cmd.Parameters.AddWithValue("@dob", TextBox30.Text);
        cmd.Parameters.AddWithValue("@email_id", TextBox11.Text);
        cmd.Parameters.AddWithValue("@nationality", TextBox31.Text);
        if (RadioButton1.Checked)
            cmd.Parameters.AddWithValue("@sex", "M");
        else
            cmd.Parameters.AddWithValue("@sex", "F");

        cmd.Parameters.AddWithValue("@mobile_no", Convert.ToInt64(TextBox8.Text));
        String str = TextBox9.Text + "-" + TextBox10.Text;
        cmd.Parameters.AddWithValue("@telephone_no", str);
        cmd.Parameters.AddWithValue("@blood_group", TextBox12.Text);
        cmd.Parameters.AddWithValue("@yoj", System.DateTime.Now);
        cmd.Parameters.AddWithValue("@house", "yellow");
        cmd.Parameters.AddWithValue("@g_last_name", TextBox13.Text);
        cmd.Parameters.AddWithValue("@g_first_name", TextBox5.Text);
        cmd.Parameters.AddWithValue("@g_middle_name", TextBox6.Text);
        cmd.Parameters.AddWithValue("@g_address", TextArea2.InnerText);
        cmd.Parameters.AddWithValue("@g_postal_code", TextBox14.Text);
        cmd.Parameters.AddWithValue("@g_dob", TextBox34.Text);
        cmd.Parameters.AddWithValue("@g_email_id", TextBox18.Text);
        cmd.Parameters.AddWithValue("@g_nationality", DropDownList1.SelectedItem.ToString());
        if (RadioButton3.Checked)
            cmd.Parameters.AddWithValue("@g_sex", "M");
        else
            cmd.Parameters.AddWithValue("@g_sex", "F");

        cmd.Parameters.AddWithValue("@g_mobile_no", Convert.ToInt64(TextBox15.Text));
        String tele = "";
        if (!TextBox10.Text.ToString().Equals("") && !TextBox9.Text.ToString().Equals(""))
        {
            tele = TextBox9.Text + "-" + TextBox10.Text;
        }
        cmd.Parameters.AddWithValue("@g_telephone_no", tele);
        cmd.Parameters.AddWithValue("@relation", TextBox33.Text);
        string password = Membership.GeneratePassword(5, 0);
        cmd.Parameters.Add("@password", SqlDbType.VarChar).Value = password;
        cmd.Parameters.Add("@app_no", SqlDbType.BigInt).Value = HiddenField1.Value;
        if (Img1.Src.ToString().Equals(""))
            cmd.Parameters.Add("@check", SqlDbType.BigInt).Value = 0;
        else
            cmd.Parameters.Add("@check", SqlDbType.BigInt).Value = 1;
        SqlDataReader reader = cmd.ExecuteReader();
        if (reader.HasRows)
        {
            reader.Read();
            
            if (!Img1.Src.ToString().Equals(""))
            {
               //MessageBox.Show(Img1.Src.ToString());
                System.IO.File.Move(Server.MapPath(Img1.Src.ToString()), Server.MapPath("~/Uploads/Student/" + reader.GetValue(1).ToString()));
            }
              if (!TextBox11.Text.ToString().Equals("") || !TextBox18.Text.ToString().Equals(""))
              {
                  SmtpClient smtp = new SmtpClient();
                  {
                      smtp.Host = "smtp.gmail.com";
                      smtp.Port = 587;
                      smtp.EnableSsl = true;
                      smtp.DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network;
                      smtp.Credentials = new NetworkCredential("bhattacharyaanirban7@gmail.com", "abhijanashakuntalam/,///");
                      smtp.Timeout = 20000;
                  }
                  string message = "Your user id is:" + reader.GetValue(0).ToString() + " and password is:" + password;
                  if (!TextBox11.Text.ToString().Equals(""))
                  {
                    //  smtp.Send("bhattacharyaanirban7@gmail.com", TextBox11.Text, "Registration Successful", message);
                  }
                  if (!TextBox18.Text.ToString().Equals(""))
                  {
                      //smtp.Send("bhattacharyaanirban7@gmail.com", TextBox18.Text, "Registration Successful", message);
                  }
              }
            clearallcontrols(Page);
            ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language$='text/javascript' src$='~/js/JScript'>alert('Student Registered.')</script>");

        }
        else
        {
            ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language$='text/javascript' src$='~/js/JScript'>alert('Registration Failed.')</script>");
           
        }
        conn.Close();
            
    }
    protected void clearallcontrols(Control parent)
    {
        foreach (Control c in parent.Controls)
        {
            if (c is TextBox)
                ((TextBox)(c)).Text = "";
            if (c is RadioButton)
                ((RadioButton)(c)).Checked = false;
           // if (c is DropDownList)
             //   ((DropDownList)(c)).ClearSelection();
            TextArea1.InnerText = "";
            TextArea2.InnerText = "";
            Img1.Src = "";
            clearallcontrols(c);
            
        }
        DropDownList1.SelectedIndex = 0;
    }
    
    protected void Button5_Click(object sender, EventArgs e)
    {
        clearallcontrols(Page);
    }
    protected void Button6_Click(object sender, EventArgs e)
    {
        clearallcontrols(Page);
    }
}
