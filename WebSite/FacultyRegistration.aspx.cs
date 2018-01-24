using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Net.Mail;
using System.Net;
using System.Web.Security;
using System.Collections;

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
            Button2.Visible = false;
                    
        }

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        String connString = ConfigurationManager.ConnectionStrings["school_management_systemConnectionString"].ConnectionString;
        SqlConnection conn = new SqlConnection();
        conn.ConnectionString = connString;
        conn.Open();
        SqlCommand cmd = new SqlCommand("faculty_registration", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@last_name", SqlDbType.VarChar).Value = TextBox3.Text;
        cmd.Parameters.Add("@first_name", SqlDbType.VarChar).Value = TextBox1.Text;
        cmd.Parameters.Add("@middle_name", SqlDbType.VarChar).Value = TextBox2.Text;
        cmd.Parameters.Add("@dob", SqlDbType.Date).Value = TextBox30.Text;
        cmd.Parameters.Add("@s_address", SqlDbType.VarChar).Value = TextArea1.InnerText;
        cmd.Parameters.Add("@mobile_no", SqlDbType.BigInt).Value = TextBox8.Text;
        cmd.Parameters.Add("@postal_code", SqlDbType.Int).Value = TextBox7.Text;
        String tele = "";
        if (!TextBox10.Text.ToString().Equals("") && !TextBox9.Text.ToString().Equals(""))
        {
            tele = TextBox9.Text + "-" + TextBox10.Text;
        }
        cmd.Parameters.Add("@telephone_no", SqlDbType.VarChar).Value =tele;
        cmd.Parameters.Add("@email_id", SqlDbType.VarChar).Value = TextBox11.Text;
        cmd.Parameters.Add("@blood_group", SqlDbType.VarChar).Value = TextBox12.Text;
        cmd.Parameters.Add("@nationality", SqlDbType.VarChar).Value = DropDownList1.SelectedItem.Text;
        cmd.Parameters.Add("@year_of_joining", SqlDbType.Date).Value = TextBox31.Text;
        cmd.Parameters.Add("@qualification", SqlDbType.VarChar).Value = TextArea2.InnerText;
        if (RadioButton1.Checked)
            cmd.Parameters.Add("@sex", SqlDbType.VarChar).Value = "M";
        else
            cmd.Parameters.Add("@sex", SqlDbType.VarChar).Value = "F";
        string password = Membership.GeneratePassword(5, 0);
        cmd.Parameters.Add("@password",SqlDbType.VarChar).Value=password;
        if (Image1.ImageUrl.ToString().Equals(""))
            cmd.Parameters.Add("@check", SqlDbType.BigInt).Value = 0;
        else
            cmd.Parameters.Add("@check", SqlDbType.BigInt).Value = 1;
       
        SqlDataReader reader=cmd.ExecuteReader();
        if (reader.HasRows)
        {
            reader.Read();
            if (!Image1.ImageUrl.ToString().Equals(""))
            {
                //MessageBox.Show(HiddenField1.Value.ToString());
                System.IO.File.Move(Server.MapPath(Image1.ImageUrl.ToString()), Server.MapPath("~/Uploads/Faculty/" + reader.GetValue(1).ToString()));
            }
            if (!TextBox11.Text.ToString().Equals(""))
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
                smtp.Send("bhattacharyaanirban7@gmail.com", TextBox11.Text, "Registration Successful", message);
            }
            clearallcontrols(Page);
            ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language$='text/javascript' src$='~/js/JScript'>alert('Faculty Registered')</script>");
            lblMessage.Text = "";
            HiddenField2.Value = "";
            Button2.Visible = false;
            btnUpload.Enabled = true;
        }
        else
        {
            ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language$='text/javascript' src$='~/js/JScript'>alert('Error not updated')</script>");
            lblMessage.Text = "";
            HiddenField2.Value = "";
            Button2.Visible = false;
            btnUpload.Enabled = true;
        }
        reader.Close();
        conn.Close();
        
    }
    protected void btnUpload_Click(object sender, EventArgs e)
    {
        HiddenField2.Value = "true";
    }
    protected void complete(object sender, AjaxControlToolkit.AsyncFileUploadEventArgs e)
    {
        string[] f1 = AsyncFileUpload1.PostedFile.ContentType.ToString().Split('/');
        int q = f1.Length;
        if (!HiddenField2.Value.ToString().Equals(""))
        {
            if (f1[q - 1].Equals("jpg") || f1[q - 1].Equals("jpeg"))
            {
                // MessageBox.Show(lblMessage.Text);
                //  lblMessage.Text = "File uploaded successfully";
                string[] f = AsyncFileUpload1.PostedFile.FileName.Split('.');
                int i = f.Length;
                int x = Convert.ToInt32(Application["image"]) + 1;
                Application["image"] = x;
                AsyncFileUpload1.SaveAs(Server.MapPath("~/temp/" + "image" + x.ToString() + "." + f[i - 1]));
                lblMessage.Text = "File Uploaded Successfully";
                Image1.ImageUrl = "~/temp/" + "image" + x.ToString() + "." + f[i - 1];
                btnUpload.Enabled = false;
              //  HiddenField1.Value = Image1.ImageUrl;

                UpdatePanel1.Update();
                UpdatePanel2.Update();
                Button2.Visible = true;
            }
        }
    }

    protected void notcomplete(object sender, AjaxControlToolkit.AsyncFileUploadEventArgs e)
    {
        if (!IsPostBack)
            lblMessage.Text = "File not upated";
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        System.IO.File.Delete(Server.MapPath(Image1.ImageUrl.ToString()));
        Application["image"] = Convert.ToInt32(Application["image"]) - 1;
        btnUpload.Enabled = true;

        Image1.ImageUrl = "";
        // Image1.Visible = false;
        HiddenField2.Value = "";
        UpdatePanel1.Update();
        UpdatePanel2.Update();
        Button2.Visible = false;
        lblMessage.Text = "File Removed Upload New Pic";
    }
    protected void clearallcontrols(Control parent)
    {
        foreach (Control c in parent.Controls)
        {
            if (c is TextBox)
                ((TextBox)(c)).Text = "";
            if (c is RadioButton)
                ((RadioButton)(c)).Checked = false;
            clearallcontrols(c);
        }
        TextArea1.InnerText = "";
        TextArea2.InnerText = "";
        lblMessage.Text = "";
        DropDownList1.ClearSelection();
        btnUpload.Enabled = true;
    }


    protected void Button3_Click(object sender, EventArgs e)
    {
        clearallcontrols(Page);
    }
}