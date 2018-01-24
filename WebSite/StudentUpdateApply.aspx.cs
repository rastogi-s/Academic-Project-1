using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Xml;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            Button4.Visible = false;
        if (Session["user_id"] == null)
        {
            Response.Redirect("Login.aspx");
        }
       
        if (!IsPostBack)
        {
            String str=Session["user_id"].ToString();
            String connString = ConfigurationManager.ConnectionStrings["school_management_systemConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = connString;
            conn.Open();
            SqlCommand cmd = new SqlCommand("student_view", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@reg_no", SqlDbType.VarChar).Value = str;
            cmd.Parameters.Add("@acad_year", SqlDbType.VarChar).Value = DateTime.Now.Year;
            SqlDataReader reader;
            reader = cmd.ExecuteReader();
            if (reader.HasRows)
            {
                reader.Read();
                if (!reader.GetValue(15).ToString().Equals(""))
                    Image1.ImageUrl = HiddenField4.Value = "Uploads/Student/" + reader.GetValue(15).ToString();
                else
                    Image1.ImageUrl = "";
                TextBox2.Text = reader.GetValue(3).ToString();
                TextBox4.Text = reader.GetValue(2).ToString();
                TextBox3.Text = reader.GetValue(13).ToString();
                TextBox30.Text = reader.GetValue(7).ToString().Remove(reader.GetValue(7).ToString().IndexOf(' '));
                TextArea1.InnerText = reader.GetValue(4).ToString();
                TextBox7.Text = reader.GetValue(5).ToString();
                TextBox8.Text = reader.GetValue(11).ToString();
                if (reader.GetValue(10).ToString().ToUpper().Equals("M"))
                    RadioButton1.Checked = true;
                else
                    RadioButton2.Checked = true;
                TextBox11.Text = reader.GetValue(6).ToString();
                TextBox12.Text = reader.GetValue(9).ToString();
                TextBox31.Text = reader.GetValue(8).ToString().ToUpper();
                TextBox5.Text = reader.GetValue(19).ToString();
                TextBox6.Text = reader.GetValue(29).ToString();
                if (!reader.GetValue(12).ToString().Equals(""))
                {
                    TextBox9.Text = reader.GetValue(12).ToString().Remove(reader.GetValue(12).ToString().IndexOf("-"));
                    TextBox10.Text = reader.GetValue(12).ToString().Substring(reader.GetValue(12).ToString().IndexOf("-") + 1);
                }
                if (reader.GetValue(26).ToString().ToUpper().Equals("M"))
                    RadioButton3.Checked = true;
                else
                    RadioButton4.Checked = true;
                TextArea4.InnerText = reader.GetValue(20).ToString();
                TextBox13.Text = reader.GetValue(18).ToString();
                TextBox15.Text = reader.GetValue(27).ToString();
                if (!reader.GetValue(28).ToString().Equals(""))
                {
                    TextBox16.Text = reader.GetValue(28).ToString().Remove(reader.GetValue(28).ToString().IndexOf("-"));
                    TextBox17.Text = reader.GetValue(28).ToString().Substring(reader.GetValue(28).ToString().IndexOf("-") + 1);
                }
                TextBox18.Text = reader.GetValue(22).ToString();
                TextBox32.Text = reader.GetValue(24).ToString();
                TextBox33.Text = reader.GetValue(25).ToString();
                TextBox14.Text = reader.GetValue(21).ToString();
                TextBox1.Text = reader.GetValue(23).ToString().Remove(reader.GetValue(23).ToString().IndexOf(' '));
            }
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
                Button4.Visible = true;
            }
        }
    }

    protected void notcomplete(object sender, AjaxControlToolkit.AsyncFileUploadEventArgs e)
    {
        if (!IsPostBack)
            lblMessage.Text = "File not upated";
    }
    protected void Button2_Click1(object sender, EventArgs e)
    {
        System.IO.File.Delete(Server.MapPath(Image1.ImageUrl.ToString()));
        Application["image"] = Convert.ToInt32(Application["image"]) - 1;
        btnUpload.Enabled = true;

        Image1.ImageUrl = "";
        // Image1.Visible = false;
        HiddenField2.Value = "";
        UpdatePanel1.Update();
        UpdatePanel2.Update();
        Button4.Visible = false;
        lblMessage.Text = "File Removed Upload New Pic";
    }
   
    
    protected XmlNode CreateUpdateNode(XmlDocument doc)
    {
        XmlNode updateNode = doc.CreateElement("update");

        XmlNode reg_no = doc.CreateElement("regnno");
        reg_no.InnerText = Session["user_id"].ToString();
        updateNode.AppendChild(reg_no);

        XmlNode firstname = doc.CreateElement("firstname");
        firstname.InnerText = TextBox2.Text;
        updateNode.AppendChild(firstname);

        XmlNode middlename = doc.CreateElement("middlename");
        middlename.InnerText = TextBox3.Text;
        updateNode.AppendChild(middlename);

        XmlNode lastname = doc.CreateElement("lastname");
        lastname.InnerText = TextBox4.Text;
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
        telephone.InnerText = TextBox9.Text + "-" + TextBox10.Text;
        updateNode.AppendChild(telephone);

        XmlNode email = doc.CreateElement("email");
        email.InnerText = TextBox11.Text;
        updateNode.AppendChild(email);

        XmlNode bloodgroup = doc.CreateElement("bloodgroup");
        bloodgroup.InnerText = TextBox12.Text;
        updateNode.AppendChild(bloodgroup);

        XmlNode nationality = doc.CreateElement("nationality");
        nationality.InnerText = TextBox31.Text;
        updateNode.AppendChild(nationality);

        XmlNode imageurl = doc.CreateElement("imageurl");
        imageurl.InnerText = Image1.ImageUrl;
        if (!Image1.ImageUrl.ToString().Equals(""))
            imageurl.InnerText = "PicUpdateApply/Student/" + Image1.ImageUrl.ToString().Substring(Image1.ImageUrl.ToString().LastIndexOf('/') + 1);
        updateNode.AppendChild(imageurl);

        XmlNode gfirstname = doc.CreateElement("gfirstname");
        gfirstname.InnerText = TextBox5.Text;
        updateNode.AppendChild(gfirstname);

        XmlNode gmiddlename = doc.CreateElement("gmiddlename");
        gmiddlename.InnerText = TextBox6.Text;
        updateNode.AppendChild(gmiddlename);

        XmlNode glastname = doc.CreateElement("glastname");
        glastname.InnerText = TextBox13.Text;
        updateNode.AppendChild(glastname);

        XmlNode gdob = doc.CreateElement("gdob");
        gdob.InnerText = TextBox1.Text;
        updateNode.AppendChild(gdob);

        XmlNode ggender = doc.CreateElement("ggender");
        if (RadioButton3.Checked == true)
            ggender.InnerText = "M";
        else
            ggender.InnerText = "F";
        updateNode.AppendChild(ggender);

        XmlNode gaddress = doc.CreateElement("gaddress");
        gaddress.InnerText = TextArea4.InnerText;
        updateNode.AppendChild(gaddress);

        XmlNode grelation = doc.CreateElement("grelation");
        grelation.InnerText = TextBox33.Text;
        updateNode.AppendChild(grelation);

        XmlNode gpostalcode = doc.CreateElement("gpostalcode");
        gpostalcode.InnerText = TextBox14.Text;
        updateNode.AppendChild(gpostalcode);

        XmlNode gmobile = doc.CreateElement("gmobile");
        gmobile.InnerText = TextBox15.Text;
        updateNode.AppendChild(gmobile);

        XmlNode gtelephone = doc.CreateElement("gtelephone");
        gtelephone.InnerText = TextBox16.Text + "-" + TextBox17.Text;
        updateNode.AppendChild(gtelephone);

        XmlNode gemail = doc.CreateElement("gemail");
        gemail.InnerText = TextBox18.Text;
        updateNode.AppendChild(gemail);

        
        XmlNode gnationality = doc.CreateElement("gnationality");
        gnationality.InnerText = TextBox32.Text;
        updateNode.AppendChild(gnationality);

        return updateNode;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 1;
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 0;
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        if (!Image1.ImageUrl.ToString().Equals(""))
        {
            System.IO.File.Move(Server.MapPath(Image1.ImageUrl.ToString()), Server.MapPath("~/PicUpdateApply/Student/" + Image1.ImageUrl.ToString().Substring(Image1.ImageUrl.ToString().LastIndexOf('/') + 1)));
           // Image1.ImageUrl = Server.MapPath("~/PicUpdateApply/Student/" + HiddenField1.Value.Substring(HiddenField1.Value.LastIndexOf('/') + 1));

            lblMessage.Text = "";
            HiddenField2.Value = "";
            Button4.Visible = false;
            btnUpload.Enabled = true;
        }

        string xmlPath = MapPath("~/studentupdate.xml");

        XmlDocument doc = new XmlDocument();



        if (System.IO.File.Exists(xmlPath))
        {
            doc.Load(xmlPath);
            XmlNode updateNode = CreateUpdateNode(doc);

            XmlNode updateStoreNode = doc.SelectSingleNode("student");
            updateStoreNode.AppendChild(updateNode);

        }

        else
        {
            XmlNode declarationNode = doc.CreateXmlDeclaration("1.0", "", "");
            doc.AppendChild(declarationNode);

            XmlNode updateStoreNode = doc.CreateElement("student");
            XmlNode updateNode = CreateUpdateNode(doc);


            updateStoreNode.AppendChild(updateNode);
            doc.AppendChild(updateStoreNode);

        }
        doc.Save(xmlPath);
        ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language$='text/javascript' src$='~/js/JScript'>alert('Update Request Sent')</script>");
        MultiView1.ActiveViewIndex = 0;
    }
}