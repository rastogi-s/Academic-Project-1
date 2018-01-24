using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

public partial class Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            Button2.Visible = false;
        if (Session["user_id"] == null)
        {
            Response.Redirect("Login.aspx");
        }
       

        if (!IsPostBack)
        {
            String str = Session["user_id"].ToString();
            String connString = ConfigurationManager.ConnectionStrings["school_management_systemConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = connString;
            conn.Open();
            SqlCommand cmd = new SqlCommand("faculty_view", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@faculty_id", SqlDbType.VarChar).Value = str;
            SqlDataReader reader;
            reader = cmd.ExecuteReader();
            if (reader.HasRows)
            {
                reader.Read();
                if (!reader.GetValue(15).ToString().Equals(""))
                    Image1.ImageUrl = HiddenField4.Value = "Uploads/Faculty/" + reader.GetValue(15).ToString();
                else
                    Image1.ImageUrl = "";
                TextBox1.Text = reader.GetValue(3).ToString();
                TextBox2.Text = reader.GetValue(14).ToString();
                TextBox3.Text = reader.GetValue(2).ToString();
                if (!reader.GetValue(7).ToString().Equals(""))
                    TextBox30.Text = reader.GetValue(7).ToString().Remove(reader.GetValue(7).ToString().IndexOf(' '));
                if (reader.GetValue(10).ToString().ToUpper().Equals("M"))
                    RadioButton1.Checked = true;
                else
                    RadioButton2.Checked = true;
                TextArea1.InnerText = reader.GetValue(4).ToString();
                TextBox7.Text = reader.GetValue(5).ToString();
                TextBox8.Text = reader.GetValue(11).ToString();
                if (!reader.GetValue(12).ToString().Equals(""))
                {
                    TextBox9.Text = reader.GetValue(12).ToString().Remove(reader.GetValue(12).ToString().IndexOf("-"));
                    TextBox10.Text = reader.GetValue(12).ToString().Substring(reader.GetValue(12).ToString().IndexOf("-") + 1);
                }
                TextBox11.Text = reader.GetValue(6).ToString();
                TextBox12.Text = reader.GetValue(9).ToString();
                TextBox33.Text = reader.GetValue(8).ToString();
                if (!reader.GetValue(13).ToString().Equals(""))
                    TextBox31.Text = reader.GetValue(13).ToString().Remove(reader.GetValue(13).ToString().IndexOf(' '));
                TextArea2.InnerText = reader.GetValue(16).ToString();
            }
            conn.Close();
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
                    //HiddenField1.Value = Image1.ImageUrl;

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
   
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (!Image1.ImageUrl.ToString().Equals(""))
        {
            System.IO.File.Move(Server.MapPath(Image1.ImageUrl.ToString()), Server.MapPath("~/PicUpdateApply/Faculty/" + Image1.ImageUrl.ToString().Substring(Image1.ImageUrl.ToString().LastIndexOf('/') + 1)));
            //  Img1.Src = Server.MapPath("~/PicUpdateApply/Faculty/" + HiddenField1.Value.Substring(HiddenField1.Value.LastIndexOf('/') + 1));

            lblMessage.Text = "";
            HiddenField2.Value = "";
            Button2.Visible = false;
            btnUpload.Enabled = true;
            
        }
        
       
        string xmlPath = MapPath("facultyupdate.xml");

        XmlDocument doc = new XmlDocument();

        

     if (System.IO.File.Exists(xmlPath))
        {
        doc.Load(xmlPath);
        XmlNode updateNode = CreateUpdateNode(doc);
        
        XmlNode updateStoreNode = doc.SelectSingleNode("faculty");
        updateStoreNode.AppendChild(updateNode);
        
        }

        else
        {
        XmlNode declarationNode = doc.CreateXmlDeclaration("1.0", "", "");
        doc.AppendChild(declarationNode);

        XmlNode updateStoreNode = doc.CreateElement("faculty");  
        XmlNode updateNode = CreateUpdateNode(doc); 

        
        updateStoreNode.AppendChild(updateNode);
        doc.AppendChild(updateStoreNode);
      
        }
        doc.Save(xmlPath);
        ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language$='text/javascript' src$='~/js/JScript'>alert('Update Request Sent')</script>");
     }
protected XmlNode CreateUpdateNode(XmlDocument doc)
    {
    XmlNode updateNode = doc.CreateElement("update");

    XmlNode facultyid = doc.CreateElement("facultyid");
    facultyid.InnerText = Session["user_id"].ToString();
    updateNode.AppendChild(facultyid);

    XmlNode firstname = doc.CreateElement("firstname"); 
    firstname.InnerText = TextBox1.Text;
    updateNode.AppendChild(firstname);
    
    XmlNode middlename = doc.CreateElement("middlename");
    middlename.InnerText = TextBox2.Text;
    updateNode.AppendChild(middlename);
    
    XmlNode lastname = doc.CreateElement("lastname");
    lastname.InnerText = TextBox3.Text;
    updateNode.AppendChild(lastname);

    XmlNode dob = doc.CreateElement("dob");
    dob.InnerText = TextBox30.Text;
    updateNode.AppendChild(dob);

    XmlNode gender = doc.CreateElement("gender");
    if (RadioButton1.Checked == true)
        gender.InnerText = "M";
    else
        gender.InnerText = "F";
    updateNode.AppendChild(gender);

    XmlNode address = doc.CreateElement("address");
    address.InnerText = TextArea1.InnerText;
    updateNode.AppendChild(address);

    XmlNode postalcode = doc.CreateElement("postalcode");
    postalcode.InnerText = TextBox7.Text;
    updateNode.AppendChild(postalcode);

    XmlNode mobile = doc.CreateElement("mobile");
    mobile.InnerText = TextBox8.Text;
    updateNode.AppendChild(mobile);

    XmlNode telephone = doc.CreateElement("telephone");
    telephone.InnerText = TextBox9.Text+"-"+TextBox10.Text;
    updateNode.AppendChild(telephone);

    XmlNode email = doc.CreateElement("email");
    email.InnerText = TextBox11.Text;
    updateNode.AppendChild(email);

    XmlNode bloodgroup = doc.CreateElement("bloodgroup");
    bloodgroup.InnerText = TextBox12.Text;
    updateNode.AppendChild(bloodgroup);

    XmlNode nationality = doc.CreateElement("nationality");
    nationality.InnerText = TextBox33.Text;
    updateNode.AppendChild(nationality);

    XmlNode doj = doc.CreateElement("doj");
    doj.InnerText = TextBox31.Text;
    updateNode.AppendChild(doj);

    XmlNode qualification = doc.CreateElement("qualification");
    qualification.InnerText = TextArea2.InnerText;
    updateNode.AppendChild(qualification);

    XmlNode imageurl = doc.CreateElement("imageurl");
    if (!Image1.ImageUrl.ToString().Equals(""))
        imageurl.InnerText = "PicUpdateApply/Faculty/" + Image1.ImageUrl.ToString().Substring(Image1.ImageUrl.ToString().LastIndexOf('/') + 1);
    else
        imageurl.InnerText = Image1.ImageUrl;
    updateNode.AppendChild(imageurl);

     
    return updateNode;

   
    }
}