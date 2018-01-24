using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;

using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;



public partial class onlineAdmissionRequestform : System.Web.UI.Page
{
    
    protected void Page_Load(object sender, EventArgs e)
    {
       
        if (!IsPostBack)
            Button2.Visible = false;

       CompareValidator4.ValueToCompare = DateTime.Now.AddYears(-2).ToString();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {

        string connString = ConfigurationManager.ConnectionStrings["school_management_systemConnectionString"].ConnectionString;
        SqlConnection conn = new SqlConnection();
        conn.ConnectionString = connString;
        conn.Open();

        SqlCommand cmd = new SqlCommand("application_registration", conn);
            
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@last",SqlDbType.VarChar).Value= TextBox3.Text;
            cmd.Parameters.Add("@first", SqlDbType.VarChar).Value=TextBox1.Text;
            cmd.Parameters.Add("@middle_name", SqlDbType.VarChar).Value=TextBox2.Text;
            cmd.Parameters.Add("@add", SqlDbType.VarChar).Value= TextArea1.InnerText;
            cmd.Parameters.Add("@postal",SqlDbType.BigInt).Value=TextBox7.Text;
            cmd.Parameters.Add("@dob_", SqlDbType.Date).Value = TextBox13.Text;
            cmd.Parameters.Add("@email_id", SqlDbType.VarChar).Value = TextBox11.Text;
            cmd.Parameters.Add("@nationality", SqlDbType.VarChar).Value = DropDownList1.SelectedItem.ToString();
            if (RadioButton1.Checked)
                cmd.Parameters.Add("@sex",SqlDbType.Char).Value= "m";
            else
                cmd.Parameters.Add("@sex",SqlDbType.Char).Value= "f";

            cmd.Parameters.Add("@mobile", SqlDbType.BigInt).Value=TextBox8.Text;
             String str = "";
            if (!TextBox10.Text.ToString().Equals("") && !TextBox9.Text.ToString().Equals(""))
            {
                str = TextBox9.Text + "-" + TextBox10.Text;
            }
            cmd.Parameters.Add("@telephone",SqlDbType.VarChar).Value=str;
            cmd.Parameters.Add("@blood_group", SqlDbType.VarChar).Value=TextBox12.Text;
            cmd.Parameters.Add("@add_class",SqlDbType.VarChar).Value= DropDownList2.SelectedItem.ToString();
            cmd.Parameters.Add("@g_first", SqlDbType.VarChar).Value=TextBox4.Text;
            cmd.Parameters.Add("@g_middle", SqlDbType.VarChar).Value=TextBox5.Text;
            cmd.Parameters.Add("@g_last",SqlDbType.VarChar).Value= TextBox6.Text;
            if (Image1.ImageUrl.ToString().Equals(""))
                cmd.Parameters.Add("@check", SqlDbType.BigInt).Value = 0;
            else
                cmd.Parameters.Add("@check", SqlDbType.BigInt).Value = 1;
            SqlDataReader reader;
            reader = cmd.ExecuteReader();
            reader.Read();
           
            
            if (reader.HasRows)
            {
                if (!Image1.ImageUrl.ToString().Equals(""))
                {
                    //MessageBox.Show(HiddenField1.Value.ToString());
                    System.IO.File.Move(Server.MapPath(Image1.ImageUrl.ToString()), Server.MapPath("~/Application_form_pic/" + reader.GetValue(0).ToString()));
                }
               clearallcontrols(Page);
               ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language$='text/javascript' src$='~/js/JScript'>alert('application submitted')</script>");
               // MessageBox.Show("Application Submitted");
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
        if(!IsPostBack)
        lblMessage.Text = "File not upated";
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        System.IO.File.Delete(Server.MapPath(Image1.ImageUrl.ToString()));
        Application["image"] = Convert.ToInt32(Application["image"])- 1;
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
            TextArea1.InnerText = "";
            
            clearallcontrols(c);

        }
        DropDownList1.SelectedIndex = 0;
        DropDownList1.SelectedIndex = 1;
        lblMessage.Text = "";
        btnUpload.Enabled = true;
        
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        clearallcontrols(Page);
    }
}
       
        
    
    