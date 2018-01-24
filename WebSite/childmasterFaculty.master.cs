using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class childmasterFaculty : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void LinkButton12_Click(object sender, EventArgs e)
    {
        Response.Redirect("ResetPassFaculty.aspx");
    }
    protected void LinkButton10_Click(object sender, EventArgs e)
    {
        Response.Redirect("FacultySection.aspx");
    }

    protected void HyperLink1_Click(object sender, EventArgs e)
    {
        Response.Redirect("Profile_faculty.aspx");
    }
    protected void HyperLink2_Click(object sender, EventArgs e)
    {
        Response.Redirect("FacultyUpdateApply.aspx");
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("faculty_home.aspx");
    }
}
