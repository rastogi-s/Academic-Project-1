using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

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
            DropDownList1.Items.Add("Regn No");
            XmlDocument doc = new XmlDocument();
            if (System.IO.File.Exists(MapPath("~/studentupdate.xml")))
            {
                doc.Load(MapPath("~/studentupdate.xml"));
                XmlNode root = doc.SelectSingleNode("student");
                foreach (XmlNode node in root.ChildNodes)
                {
                    DropDownList1.Items.Add(node.SelectSingleNode("regnno").InnerText);
                }
            }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 1;
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 0;
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
             XmlDocument doc = new XmlDocument();
        doc.Load(MapPath("~/studentupdate.xml"));
        XmlNode root = doc.SelectSingleNode("student");
        XmlNode reqnode = null;
        foreach (XmlNode node in root.ChildNodes)
        {
            if (node.SelectSingleNode("regnno").InnerText.Equals(DropDownList1.SelectedItem.ToString()))
            {
                reqnode = node;
                break;
            }
        }
    
            TextBox2.Text = reqnode.SelectSingleNode("firstname").InnerText;
            TextBox4.Text = reqnode.SelectSingleNode("lastname").InnerText;
            TextBox3.Text = reqnode.SelectSingleNode("middlename").InnerText;
            TextBox30.Text = reqnode.SelectSingleNode("dob").InnerText;
            TextArea1.InnerText = reqnode.SelectSingleNode("address").InnerText;
            TextBox7.Text = reqnode.SelectSingleNode("postalcode").InnerText;
            TextBox8.Text = reqnode.SelectSingleNode("mobile").InnerText;
            if (reqnode.SelectSingleNode("gender").InnerText.ToUpper().Equals("M"))
                RadioButton1.Checked = true;
            else
                RadioButton2.Checked = true;
            TextBox11.Text = reqnode.SelectSingleNode("email").InnerText;
            TextBox12.Text = reqnode.SelectSingleNode("bloodgroup").InnerText;
            TextBox31.Text = reqnode.SelectSingleNode("nationality").InnerText;
            TextBox5.Text = reqnode.SelectSingleNode("gfirstname").InnerText;
            TextBox6.Text = reqnode.SelectSingleNode("gmiddlename").InnerText;
            if (!reqnode.SelectSingleNode("telephone").InnerText.Equals(""))
            {
                TextBox9.Text = reqnode.SelectSingleNode("telephone").InnerText.Remove(reqnode.SelectSingleNode("telephone").InnerText.IndexOf("-"));
                TextBox10.Text = reqnode.SelectSingleNode("telephone").InnerText.Substring(reqnode.SelectSingleNode("telephone").InnerText.IndexOf("-") + 1);
            }
            if (reqnode.SelectSingleNode("ggender").InnerText.ToUpper().Equals("M"))
                RadioButton3.Checked = true;
            else
                RadioButton4.Checked = true;
            TextArea4.InnerText = reqnode.SelectSingleNode("gaddress").InnerText;
            TextBox13.Text = reqnode.SelectSingleNode("glastname").InnerText;
            TextBox15.Text = reqnode.SelectSingleNode("gmobile").InnerText;
            if (!reqnode.SelectSingleNode("gtelephone").InnerText.Equals(""))
            {
                TextBox16.Text = reqnode.SelectSingleNode("gtelephone").InnerText.Remove(reqnode.SelectSingleNode("gtelephone").InnerText.IndexOf("-"));
                TextBox17.Text = reqnode.SelectSingleNode("gtelephone").InnerText.Substring(reqnode.SelectSingleNode("gtelephone").InnerText.IndexOf("-") + 1);
            }
            TextBox18.Text = reqnode.SelectSingleNode("gemail").InnerText;
            TextBox32.Text = reqnode.SelectSingleNode("gnationality").InnerText;
            TextBox33.Text = reqnode.SelectSingleNode("grelation").InnerText;
            TextBox14.Text = reqnode.SelectSingleNode("gpostalcode").InnerText;
            TextBox1.Text = reqnode.SelectSingleNode("gdob").InnerText;
            Img1.Src = reqnode.SelectSingleNode("imageurl").InnerText;
        }
           
    
    protected void Button3_Click(object sender, EventArgs e)
    {
        if (DropDownList1.SelectedIndex == 0)
        {
            ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language$='text/javascript' src$='~/js/JScript'>alert('Registration number not selected')</script>");
            return;
        }
        string imageurl = "";
        String connString = ConfigurationManager.ConnectionStrings["school_management_systemConnectionString"].ConnectionString;
        SqlConnection conn = new SqlConnection();
        conn.ConnectionString = connString;
        conn.Open();
        SqlCommand cmd = new SqlCommand("select sno,image_url from student_table where reg_no='" + DropDownList1.SelectedItem.ToString() + "'", conn);
        SqlDataReader reader = cmd.ExecuteReader();
        reader.Read();
             int check=-1;
            if (!reader.GetValue(1).ToString().Equals("") && !Img1.Src.ToString().Equals(""))
            {
                imageurl = reader.GetValue(1).ToString();
                check = 0;
            }
            else if (reader.GetValue(1).ToString().Equals("") && !Img1.Src.ToString().Equals(""))
            {
                imageurl = "image_stu" + reader.GetValue(0).ToString() + ".jpg";
                check = 1;
            }
            else if (!Img1.Src.ToString().Equals(""))
            {
                
                check = 0;
            }
        reader.Close();
        cmd = new SqlCommand("student_prof_update", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("reg_no",SqlDbType.VarChar).Value=DropDownList1.SelectedItem.ToString();
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
        cmd.Parameters.AddWithValue("@g_last_name", TextBox13.Text);
        cmd.Parameters.AddWithValue("@g_first_name", TextBox5.Text);
        cmd.Parameters.AddWithValue("@g_middle_name", TextBox6.Text);
        cmd.Parameters.AddWithValue("@g_address", TextArea4.InnerText);
        cmd.Parameters.AddWithValue("@g_postal_code", TextBox14.Text);
        cmd.Parameters.AddWithValue("@g_dob", TextBox1.Text);
        cmd.Parameters.AddWithValue("@g_email_id", TextBox18.Text);
        cmd.Parameters.AddWithValue("@g_nationality", TextBox32.Text);
        if (RadioButton3.Checked)
            cmd.Parameters.AddWithValue("@g_sex", "M");
        else
            cmd.Parameters.AddWithValue("@g_sex", "F");

        cmd.Parameters.AddWithValue("@g_mobile_no", Convert.ToInt64(TextBox15.Text));
        String str1 = TextBox16.Text + "-" + TextBox17.Text;
        cmd.Parameters.AddWithValue("@g_telephone_no", str1);
        cmd.Parameters.AddWithValue("@relation", TextBox33.Text);
        if (check == 1)
        {
            cmd.Parameters.Add("@check", SqlDbType.BigInt).Value = 1;
            cmd.Parameters.Add("@image", SqlDbType.VarChar).Value = imageurl;
        }
        else
        {
            cmd.Parameters.Add("@check", SqlDbType.BigInt).Value = 0;
            cmd.Parameters.Add("@image", SqlDbType.VarChar).Value = imageurl;
        }
        int x = cmd.ExecuteNonQuery();
        if (x > 0)
        {
            if (!imageurl.Equals(""))
            {
                if (!Img1.Src.Remove(Img1.Src.IndexOf('/')).Equals("Uploads"))
                {
                    System.IO.File.Delete(Server.MapPath("~/Uploads/Student/" + imageurl));
                    System.IO.File.Move(Server.MapPath("~/" + Img1.Src), Server.MapPath("~/Uploads/Student/" + imageurl));
                }
            }
            removefromlist();
            clearallcontrols(Page);
            Img1.Src = "";
            ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language$='text/javascript' src$='~/js/JScript'>alert('Update Successfull')</script>");

            MultiView1.ActiveViewIndex = 0;
        }
        else
            ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language$='text/javascript' src$='~/js/JScript'>alert('Update unsuccessfull!!Try Again!')</script>");
        conn.Close();

    }
    protected void removefromlist()
    {
        XmlDocument doc = new XmlDocument();
        doc.Load(MapPath("~/studentupdate.xml"));
        XmlNode root = doc.SelectSingleNode("student");
        XmlNode reqnode = null;
        foreach (XmlNode node in root.ChildNodes)
        {
            if (node.SelectSingleNode("regnno").InnerText.Equals(DropDownList1.SelectedItem.ToString()))
            {
                reqnode = node;
                break;
            }
        }
        reqnode.ParentNode.RemoveChild(reqnode);
        doc.Save(MapPath("~/studentupdate.xml"));
        DropDownList1.Items.RemoveAt(DropDownList1.SelectedIndex);
        DropDownList1.SelectedIndex = 0;
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
            TextArea4.InnerText = "";
            clearallcontrols(c);
        }
    }
}