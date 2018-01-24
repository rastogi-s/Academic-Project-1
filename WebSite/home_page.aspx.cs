using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class home_page : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            MultiView1.ActiveViewIndex = 0;
            MultiView2.ActiveViewIndex = 0;
        }

    }

    [System.Web.Services.WebMethod]
    [System.Web.Script.Services.ScriptMethod]
    public static AjaxControlToolkit.Slide[] getslide()
    {
        AjaxControlToolkit.Slide[] imgSlide = new AjaxControlToolkit.Slide[4];


        /*Provide some images for slide show*/

        imgSlide[0] = new AjaxControlToolkit.Slide("Slides/2.jpg", "", "");
        imgSlide[1] = new AjaxControlToolkit.Slide("Slides/13.jpg", "", "");
        imgSlide[2] = new AjaxControlToolkit.Slide("Slides/16.jpg", "", "");
        imgSlide[3] = new AjaxControlToolkit.Slide("Slides/15.png", "", "");
        return (imgSlide);
    }

    protected void HyperLink2_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 1;
        MultiView2.ActiveViewIndex = 1;
    }
}