using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Label1.Text = "  " + Application["page_request"];
        if (Session["user_id"]!=null)
        {
            LinkButton6.Text = "LOGOUT" ;
        }
        else
        {
            LinkButton6.Text = "LOGIN";
        }

         
       string[] f = Request.Path.ToString().Split('/');
       int i = f.Length;
      // MessageBox.Show(f[i - 1]);
       if (f[i - 1].Equals("home_page.aspx"))
           LinkButton1.CssClass="style200";
       if (f[i - 1].Equals("About.aspx"))
           LinkButton2.CssClass = "style200";
       if (f[i - 1].Equals("Admission.aspx"))
           LinkButton3.CssClass = "style200";
       if (f[i - 1].Equals("Alumni.aspx"))
           LinkButton4.CssClass = "style200";
       if (f[i - 1].Equals("Contact_us.aspx"))
           LinkButton5.CssClass = "style200";
       if (f[i - 1].Equals("Login.aspx"))
           LinkButton6.CssClass = "style200";
      
        

      //  LinkButton1.BackColor = System.Drawing.Color.Fuchsia;
       
    }
    
    protected void LinkButton6_Click(object sender, EventArgs e)
    {

        Session["user_id"] = null;
      //  Session.Remove("user_id");
        Response.Redirect("Login.aspx");
    }

}
