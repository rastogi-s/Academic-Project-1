using System;
using System.Data;
using System.Configuration;
using System.Collections.Specialized;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.IO;

namespace Nileblitz.SIP
{
    public partial class SIP_PicViewer : System.Web.UI.Page
    {
        protected void Page_PreInit(object sender, EventArgs e)
        {
            if (Session["StyleSheetTheme"] != null && Session["StyleSheetTheme"].ToString() != "")
            {
                Page.Theme = Session["StyleSheetTheme"].ToString();
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            ContentInfoLoader cil = new ContentInfoLoader();
            string galleriesPath = "";
            if (Session["PicRootPath"] != null && Session["PicRootPath"].ToString() != "")
            {
                galleriesPath = Session["PicRootPath"].ToString();
            }
            else
            {
                galleriesPath = cil.PicRootDefaultPath;
                Session["PicRootPath"] = galleriesPath;
            }
             
            LoadGalleriesNav(galleriesPath,cil);
            if (Request["gallery"] != "" && Request["gallery"] != null)
            {
                lblGalleryName.Text = Request["gallery"];
                Int32 photoCount = LoadPhotosNav(Request["gallery"], galleriesPath, cil);
                string photoName;
                if (Request["photo"] == "" || Request["photo"] == null)
                {
                    //If the user has just clicked on the gallery, load the first photo
                    photoName = cil.GetPhotoList(Request["gallery"],Server.MapPath(galleriesPath))[0];
                    photoName = photoName.Substring(photoName.LastIndexOf("\\"));
                }
                else
                {
                    //Otherwise load the photo as in the querystring
                    photoName = Request["photo"];
                }
                char[] charSeparators = new char[] { '~', '.' };
                if (photoName.Contains("~"))
                {
                    string photoTitle = photoName.Split(charSeparators)[1];
                    lblPhotoName.Text = photoTitle.Replace("_", "&nbsp;");
                }
                else
                {
                    lblPhotoName.Text = photoName.Split(charSeparators)[0];
                }
                galleryImage.ImageUrl = galleriesPath + Request["gallery"] + "/pics/" + photoName;
            }
            else
            {
                galleryImage.ImageUrl = galleriesPath + "Howtouse.jpg";
            }
            
        }

        /// <summary>
        /// This method is supposed to load the navigation for the galleries
        /// </summary>
        /// <param name="galleriesPath"></param>
        /// <param name="cil"></param>
        public void LoadGalleriesNav(string galleriesPath, ContentInfoLoader cil)
        {
            string[] galleryPathList = new string[1];

            // Load the path info for all the galleries
            if (galleriesPath != "")
            {
                galleryPathList = cil.GetGalleryPaths(Server.MapPath(galleriesPath));
            }

            // Generate the unordered list
            HtmlGenericControl blstGalleries = new HtmlGenericControl("ul");
            blstGalleries.Attributes.Add("id", "navlist_a");

            // Generate the navigation for the galleries
            foreach (string galleryPath in galleryPathList)
            {
                string galleryName = galleryPath.Substring(galleryPath.LastIndexOf("\\") + 1);
                HtmlGenericControl galleryListItem = new HtmlGenericControl("li");
                HtmlAnchor galleryAnchor = new HtmlAnchor();
                if (Request["gallery"] != "" && Request["gallery"] != null)
                {
                    // If the gallery has not been chosen, generate a link
                    if (Request["gallery"].ToUpper() != galleryName.ToUpper())
                    {
                        galleryAnchor.Attributes.Add("onMouseOver", "ddrivetip('" + galleryName.ToUpper() + "', " + galleryName.Length * 7 + ")");
                        galleryAnchor.Attributes.Add("onMouseOut", "hideddrivetip()");
                        galleryAnchor.HRef = "PicViewer.aspx?gallery=" + galleryName;
                        galleryAnchor.InnerHtml = "<em></em>";
                    }
                    else
                    {   // if a gallery has been chosen already then gray out the selection
                        galleryAnchor.Disabled = true;
                        galleryAnchor.InnerHtml = "<em style='border-top:1em solid #696969'></em>";
                    }
                }
                else
                {// If the gallery has not been chosen, generate a link
                    galleryAnchor.Attributes.Add("onMouseOver", "ddrivetip('" + galleryName.ToUpper() + "', " + galleryName.Length * 7 + ")");
                    galleryAnchor.Attributes.Add("onMouseOut", "hideddrivetip()");
                    galleryAnchor.HRef = "PicViewer.aspx?gallery=" + galleryName;
                    galleryAnchor.InnerHtml = "<em></em>";
                }
                // add the anchor to the list
                galleryListItem.Controls.Add(galleryAnchor);
                blstGalleries.Controls.Add(galleryListItem);
            }
            galleryPlaceholder.Controls.Add(blstGalleries);
        }

        /// <summary>
        /// Load the navigation for the photos
        /// </summary>
        /// <param name="galleryName"></param>
        public Int32 LoadPhotosNav(string galleryName, string galleriesPath, ContentInfoLoader cil)
        {
            string[] photoList = new string[1];
            if (galleriesPath!= "")
            {
                photoList = cil.GetPhotoList(galleryName, Server.MapPath(galleriesPath));
            }
            if (photoList != null && photoList.Length != 0)
            {
                HtmlGenericControl blstPhotos = new HtmlGenericControl("ul");
                blstPhotos.Attributes.Add("id", "navlist_b");

                foreach (string iPhotoName in photoList)
                {
                    string photoName;
                    photoName = iPhotoName.Substring(iPhotoName.LastIndexOf("\\") + 1);
                    HtmlGenericControl photoListItem = new HtmlGenericControl("li");
                    HtmlAnchor photoAnchor = new HtmlAnchor();
                    string originalPhotoName = photoName;
                    char[] charSeparators = new char[] { '~','.' };
                    string photoTitle = "";
                    if (photoName.Contains("~"))
                    {
                        photoTitle = photoName.Split(charSeparators)[1];
                        photoName = photoName.Split(charSeparators)[0] + ".JPG";
                    }

                    if (Request["photo"] != "" && Request["photo"] != null)
                    {
                        // if a photo has been selected then we need to show that square as gray otherwise clickable and mouseover effects.
                        if (Request["photo"].ToUpper() != photoName.ToUpper())
                        {
                            if (Directory.Exists(Server.MapPath(galleriesPath + galleryName + "/thumbs/")))
                            {
                                photoAnchor.Attributes.Add("onMouseOver", "ddrivetip('<img src=\\'" + ResolveUrl(galleriesPath) + galleryName + "/thumbs/" + photoName + "\\' /><br>" + photoTitle.Replace("_", "&nbsp;") + "', " + photoTitle.Length + ")");
                            }
                            else
                            {
                                if (photoTitle != "")
                                {
                                    photoAnchor.Attributes.Add("onMouseOver", "ddrivetip('" + photoTitle.Replace("_", "&nbsp;") + "', " + photoTitle.Length + ")");
                                }
                                else
                                {
                                    photoAnchor.Attributes.Add("onMouseOver", "ddrivetip('" + photoName + "', " + photoName.Length + ")");
                                }
                            }

                            photoAnchor.Attributes.Add("onMouseOut", "hideddrivetip()");
                            photoAnchor.HRef = "PicViewer.aspx?gallery=" + galleryName + "&photo=" + originalPhotoName;
                            photoAnchor.InnerHtml = "<em></em>";
                        }
                        else
                        {
                            photoAnchor.Disabled = true;
                            photoAnchor.InnerHtml = "<em style='border-top:0.5em solid #696969'></em>";
                        }
                    }
                    else
                    {
                        if (Directory.Exists(Server.MapPath(galleriesPath + galleryName + "/thumbs/")))
                        {
                            photoAnchor.Attributes.Add("onMouseOver", "ddrivetip('<img src=\\'" + ResolveUrl(galleriesPath) + galleryName + "/thumbs/" + photoName + "\\' /><br>" + photoTitle.Replace("_", "&nbsp;") + "', " + photoTitle.Length + ")");
                        }
                        else
                        {
                            if (photoTitle != "")
                            {
                                photoAnchor.Attributes.Add("onMouseOver", "ddrivetip('" + photoTitle.Replace("_", "&nbsp;") + "', " + photoTitle.Length + ")");
                            }
                            else
                            {
                                photoAnchor.Attributes.Add("onMouseOver", "ddrivetip('" + photoName + "', " + photoName.Length + ")");
                            }
                        }

                        photoAnchor.Attributes.Add("onMouseOut", "hideddrivetip()");
                        photoAnchor.HRef = "PicViewer.aspx?gallery=" + galleryName + "&photo=" + originalPhotoName;
                        photoAnchor.InnerHtml = "<em></em>";
                    }
                    photoListItem.Controls.Add(photoAnchor);
                    blstPhotos.Controls.Add(photoListItem);
                }
                galleryPlaceholder.Controls.Add(blstPhotos);
                return photoList.Length;
            }
            else
            {
                return 0;
            }
        }
    }
}