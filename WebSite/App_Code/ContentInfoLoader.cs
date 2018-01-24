using System;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.Configuration;
using System.Web.Configuration;
using System.Collections.Specialized;
using System.IO;

namespace Nileblitz.SIP
{
    /// <summary>
    /// The ContentInfoLoader can load information about the pictures and galleries
    /// </summary>
    public class ContentInfoLoader
    {
        private String _picRootPath;
        private String _picRootDefaultPath;

        /// <summary>
        /// The constructor will load the path for the root folder for the pictures
        /// </summary>
        public ContentInfoLoader()
        {
            Configuration rootWebConfig = WebConfigurationManager.OpenWebConfiguration("~/");
            if(0<rootWebConfig.AppSettings.Settings.Count)
            {
                KeyValueConfigurationElement picRootElement = rootWebConfig.AppSettings.Settings["PicRootPath"];
                if(null!=picRootElement)
                {
                    _picRootPath=picRootElement.Value;
                }

                picRootElement = rootWebConfig.AppSettings.Settings["PicRootDefaultPath"];
                if (null != picRootElement)
                {
                    _picRootDefaultPath = picRootElement.Value;
                }
            }
        }

        public string PicRootPath
        {
            get
            {
                return _picRootPath;
            }
        }
        public string PicRootDefaultPath
        {
            get
            {
                return _picRootDefaultPath;
            }
        }

        public string[] GetGalleryPaths(string picRootRealPath) 
        {
            if (Directory.Exists(picRootRealPath))
            {
                return Directory.GetDirectories(picRootRealPath);
            }
            else
            {
                return null;
            }
        }

        public string[] GetPhotoList(string galleryName, string picRootRealPath)
        {
            string galleryPath=picRootRealPath + "\\" + galleryName + "\\pics";
            if (Directory.Exists(galleryPath))
            {
                return Directory.GetFiles(galleryPath,"*.JPG");
            }
            else
            {
                return null;
            }
        }
    } 
}
