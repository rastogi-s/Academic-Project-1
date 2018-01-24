using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Xml;
using System.Configuration;
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
            DropDownList1.Items.Add("Faculty Id");
            XmlDocument doc = new XmlDocument();
            if(System.IO.File.Exists(MapPath("~/facultyupdate.xml")))
                {
                doc.Load(MapPath("~/facultyupdate.xml"));
                XmlNode root = doc.SelectSingleNode("faculty");
                foreach (XmlNode node in root.ChildNodes)
                {
                    DropDownList1.Items.Add(node.SelectSingleNode("facultyid").InnerText);
                }
                }
         }
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        XmlDocument doc = new XmlDocument();
        doc.Load(MapPath("~/facultyupdate.xml"));
        XmlNode root = doc.SelectSingleNode("faculty");
        XmlNode reqnode=null;
        foreach (XmlNode node in root.ChildNodes)
        {
            if (node.SelectSingleNode("facultyid").InnerText.Equals(DropDownList1.SelectedItem.ToString()))
            {
                reqnode = node;
                break;
            }
        }
            TextBox1.Text=reqnode.SelectSingleNode("firstname").InnerText;
            TextBox2.Text=reqnode.SelectSingleNode("middlename").InnerText;
            TextBox3.Text=reqnode.SelectSingleNode("lastname").InnerText;
            TextBox30.Text=reqnode.SelectSingleNode("dob").InnerText;
        if(reqnode.SelectSingleNode("gender").InnerText.Equals("M"))
            RadioButton1.Checked=true;
        else
            RadioButton2.Checked=true;
        TextArea1.InnerText=reqnode.SelectSingleNode("address").InnerText;
        TextBox7.Text=reqnode.SelectSingleNode("postalcode").InnerText;
        TextBox8.Text=reqnode.SelectSingleNode("mobile").InnerText;
        TextBox9.Text=reqnode.SelectSingleNode("telephone").InnerText.Remove(reqnode.SelectSingleNode("telephone").InnerText.IndexOf('-'));
        TextBox10.Text=reqnode.SelectSingleNode("telephone").InnerText.Substring(reqnode.SelectSingleNode("telephone").InnerText.IndexOf('-')+1);
        TextBox11.Text = reqnode.SelectSingleNode("email").InnerText;
        TextBox12.Text = reqnode.SelectSingleNode("bloodgroup").InnerText;
        TextBox33.Text = reqnode.SelectSingleNode("nationality").InnerText;
        TextBox31.Text = reqnode.SelectSingleNode("doj").InnerText;
       TextArea2.InnerText = reqnode.SelectSingleNode("qualification").InnerText;
        Img1.Src = reqnode.SelectSingleNode("imageurl").InnerText;
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (DropDownList1.SelectedIndex == 0)
        {
            ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language$='text/javascript' src$='~/js/JScript'>alert('Faculty id not selected')</script>");
            return;
        }
        string imageurl="";
        String connString = ConfigurationManager.ConnectionStrings["school_management_systemConnectionString"].ConnectionString;
        SqlConnection conn = new SqlConnection();
        conn.ConnectionString = connString;
        conn.Open();
        SqlCommand cmd = new SqlCommand("select sno,image_url from faculty_table where faculty_id='" + DropDownList1.SelectedItem.ToString()+"'", conn);
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
                imageurl = "image_fac" + reader.GetValue(0).ToString() + ".jpg";
                check = 1;
            }
            else if (!Img1.Src.ToString().Equals(""))
            {
                
                check = 0;
            }
        reader.Close();
        cmd = new SqlCommand("faculty_prof_update", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@faculty_id", SqlDbType.VarChar).Value = DropDownList1.SelectedItem.ToString();
        cmd.Parameters.Add("@last_name", SqlDbType.VarChar).Value = TextBox3.Text;
        cmd.Parameters.Add("@first_name", SqlDbType.VarChar).Value = TextBox1.Text;
        cmd.Parameters.Add("@middle_name", SqlDbType.VarChar).Value = TextBox2.Text;
        cmd.Parameters.Add("@dob", SqlDbType.Date).Value = TextBox30.Text;
        cmd.Parameters.Add("@s_address", SqlDbType.VarChar).Value = TextArea1.InnerText;
        cmd.Parameters.Add("@mobile_no", SqlDbType.BigInt).Value = TextBox8.Text;
        cmd.Parameters.Add("@postal_code", SqlDbType.Int).Value = TextBox7.Text;
        cmd.Parameters.Add("@telephone_no", SqlDbType.VarChar).Value = TextBox9.Text + "-" + TextBox10.Text;
        cmd.Parameters.Add("@email_id", SqlDbType.VarChar).Value = TextBox11.Text;
        cmd.Parameters.Add("@blood_group", SqlDbType.VarChar).Value = TextBox12.Text;
        cmd.Parameters.Add("@nationality", SqlDbType.VarChar).Value = DropDownList1.SelectedItem.Text;
        cmd.Parameters.Add("@year_of_joining", SqlDbType.Date).Value = TextBox31.Text;
        cmd.Parameters.Add("@qualification", SqlDbType.VarChar).Value = TextArea2.InnerText;
        if (RadioButton1.Checked)
            cmd.Parameters.Add("@sex", SqlDbType.VarChar).Value = "M";
        else
            cmd.Parameters.Add("@sex", SqlDbType.VarChar).Value = "F";

        if (check == 1)
        {
            cmd.Parameters.Add("@check", SqlDbType.BigInt).Value = 1;
            cmd.Parameters.Add("@image", SqlDbType.VarChar).Value =imageurl;
        }
        else
        {
            cmd.Parameters.Add("@check", SqlDbType.BigInt).Value = 0;
            cmd.Parameters.Add("@image", SqlDbType.VarChar).Value = imageurl;
        }
        
        int x=cmd.ExecuteNonQuery();
        if (x > 0)
        {
            if (!imageurl.Equals(""))
            {
                if (!Img1.Src.Remove(Img1.Src.IndexOf('/')).Equals("Uploads"))
                {
                    System.IO.File.Delete(Server.MapPath("~/Uploads/Faculty/" + imageurl));
                    System.IO.File.Move(Server.MapPath("~/" + Img1.Src), Server.MapPath("~/Uploads/Faculty/" + imageurl));
                }
            }
            removefromlist();
            clearallcontrols(Page);
            Img1.Src = "";
            ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language$='text/javascript' src$='~/js/JScript'>alert('Update Successfull')</script>");
        }
        else
            ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language$='text/javascript' src$='~/js/JScript'>alert('Update unsuccessfull!!Try Again!')</script>");
        conn.Close();
    }
    protected void removefromlist()
    {
        XmlDocument doc = new XmlDocument();
        doc.Load(MapPath("~/facultyupdate.xml"));
        XmlNode root = doc.SelectSingleNode("faculty");
        XmlNode reqnode = null;
        foreach (XmlNode node in root.ChildNodes)
        {
            if (node.SelectSingleNode("facultyid").InnerText.Equals(DropDownList1.SelectedItem.ToString()))
            {
                reqnode = node;
                break;
            }
        }
        reqnode.ParentNode.RemoveChild(reqnode);
        doc.Save(MapPath("~/facultyupdate.xml"));
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
            clearallcontrols(c);
        }
    }
}
