using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class childmasterStudent : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void HyperLink1_Click(object sender, EventArgs e)
    {
        Response.Redirect("Profile_stud.aspx");
    }
    protected void LinkButton10_Click(object sender, EventArgs e)
    {
        Response.Redirect("StudentAttendanceReport.aspx");
    }
    protected void LinkButton11_Click(object sender, EventArgs e)
    {
        Response.Redirect("StudentGradeReport.aspx");
    }
    protected void LinkButton12_Click(object sender, EventArgs e)
    {
        Response.Redirect("ResetPassStudent.aspx");
    }
    protected void HyperLink2_Click(object sender, EventArgs e)
    {
        Response.Redirect("StudentUpdateApply.aspx");
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("student_home.aspx");
    }
}
