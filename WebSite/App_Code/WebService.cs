using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using AjaxControlToolkit;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;
using System.Collections.Specialized;

/// <summary>
/// Summary description for WebService
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
 [System.Web.Script.Services.ScriptService]
public class WebService : System.Web.Services.WebService {

    public WebService () {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
     //   String str = Session["user_id"].ToString();
    }

    [WebMethod(EnableSession = true)]
    public CascadingDropDownNameValue[] GetDropDownContents1(
      string knownCategoryValues, string category)
    {

        if (Session["user_id"] != null)
        {

            String str = Session["user_id"].ToString();
            string connString = ConfigurationManager.ConnectionStrings["school_management_systemConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = connString;
            conn.Open();
            SqlCommand cmd = new SqlCommand("faculty_sec_class", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@faculty_id", SqlDbType.VarChar).Value = str;

            if (DateTime.Now.Month <= 3)
                cmd.Parameters.Add("@acad_year", SqlDbType.Int).Value = (Convert.ToInt16(DateTime.Now.Year) - 1).ToString();
            else
                cmd.Parameters.Add("@acad_year", SqlDbType.Int).Value = DateTime.Now.Year.ToString();

            SqlDataReader reader;
            reader = cmd.ExecuteReader();
            List<CascadingDropDownNameValue> values =
            new List<CascadingDropDownNameValue>();

            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    // MessageBox.Show(reader.GetValue(0).ToString());

                    values.Add(new CascadingDropDownNameValue(reader.GetValue(0).ToString(), reader.GetValue(0).ToString()));

                }
                return values.ToArray();
            }
            else
            {
                return null;
            }
        }
        else
        {
            return null;
        }
        
    }


    public SqlDbType sqlDbType { get; set; }
    [WebMethod(EnableSession = true)]
    public CascadingDropDownNameValue[] GetDropDownContents2(
      string knownCategoryValues, string category)
    {

        if (Session["user_id"] != null)
        {


            String str = Session["user_id"].ToString();
            string connString = ConfigurationManager.ConnectionStrings["school_management_systemConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = connString;
            conn.Open();
            SqlCommand cmd = new SqlCommand("faculty_sec_section", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@faculty_id", SqlDbType.VarChar).Value = str;
            if (DateTime.Now.Month <= 3)
                cmd.Parameters.Add("@acad_year", SqlDbType.Int).Value = (Convert.ToInt16(DateTime.Now.Year) - 1).ToString();
            else
                cmd.Parameters.Add("@acad_year", SqlDbType.Int).Value = DateTime.Now.Year.ToString();
            StringDictionary kv = CascadingDropDown.ParseKnownCategoryValuesString(knownCategoryValues);
            string makeId = kv["class"];
            if (makeId.Equals(null))
                return null;
            cmd.Parameters.Add("@class", SqlDbType.Int).Value = makeId;
            SqlDataReader reader;
            reader = cmd.ExecuteReader();
            List<CascadingDropDownNameValue> values =
            new List<CascadingDropDownNameValue>();

            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    // MessageBox.Show(reader.GetValue(0).ToString());
                    values.Add(new CascadingDropDownNameValue(reader.GetValue(0).ToString(), reader.GetValue(0).ToString()));
                }
                return values.ToArray();
            }
            else
            {
                return null;
            }

        }
        else
        {
            return null;
        }
    }
    [WebMethod(EnableSession = true)]
    public CascadingDropDownNameValue[] GetDropDownContents3(
      string knownCategoryValues, string category)
    {

        if (Session["user_id"] != null)
        {

            String str = Session["user_id"].ToString();
            string connString = ConfigurationManager.ConnectionStrings["school_management_systemConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = connString;
            conn.Open();
            SqlCommand cmd = new SqlCommand("faculty_sec_section_course", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@faculty_id", SqlDbType.VarChar).Value = str;
            if (DateTime.Now.Month <= 3)
                cmd.Parameters.Add("@acad_year", SqlDbType.Int).Value = (Convert.ToInt16(DateTime.Now.Year) - 1).ToString();
            else
                cmd.Parameters.Add("@acad_year", SqlDbType.Int).Value = DateTime.Now.Year.ToString();
            StringDictionary kv = CascadingDropDown.ParseKnownCategoryValuesString(knownCategoryValues);
            string makeId = kv["class"];
            string sec = kv["sec"];
            if (makeId.Equals(null) && sec.Equals(null))
                return null;
            cmd.Parameters.Add("@class", SqlDbType.Int).Value = makeId;
            cmd.Parameters.Add("@section", SqlDbType.VarChar).Value = sec;
            SqlDataReader reader;
            reader = cmd.ExecuteReader();
            List<CascadingDropDownNameValue> values =
            new List<CascadingDropDownNameValue>();

            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    // MessageBox.Show(reader.GetValue(0).ToString());
                    values.Add(new CascadingDropDownNameValue(reader.GetValue(0).ToString(), reader.GetValue(0).ToString()));
                }
                return values.ToArray();
            }
            else
            {
                return null;
            }
        }
        else
        {
            return null;
        }
    }

    [WebMethod(EnableSession = true)]
    public CascadingDropDownNameValue[] GetDropDownContents4(
      string knownCategoryValues, string category)
    {
        string connString = ConfigurationManager.ConnectionStrings["school_management_systemConnectionString"].ConnectionString;
        SqlConnection conn = new SqlConnection();
        conn.ConnectionString = connString;
        conn.Open();
        SqlCommand cmd = new SqlCommand("list_class", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        SqlDataReader reader;
        reader = cmd.ExecuteReader();
        List<CascadingDropDownNameValue> values =
        new List<CascadingDropDownNameValue>();

        if (reader.HasRows)
        {
            while (reader.Read())
            {
                values.Add(new CascadingDropDownNameValue(reader.GetValue(0).ToString(), reader.GetValue(0).ToString()));
            }
            return values.ToArray();
        }
        else
        {
            return null;
        }
    }

    [WebMethod(EnableSession = true)]
    public CascadingDropDownNameValue[] GetDropDownContents5(
      string knownCategoryValues, string category)
    {
        string connString = ConfigurationManager.ConnectionStrings["school_management_systemConnectionString"].ConnectionString;
        SqlConnection conn = new SqlConnection();
        conn.ConnectionString = connString;
        conn.Open();
        SqlCommand cmd = new SqlCommand("list_section", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        StringDictionary kv = CascadingDropDown.ParseKnownCategoryValuesString(knownCategoryValues);
        string makeId = kv["class2"];
        if (makeId.Equals(null))
            return null;
        cmd.Parameters.Add("@class", SqlDbType.Int).Value = makeId;
        SqlDataReader reader;
        reader = cmd.ExecuteReader();
        List<CascadingDropDownNameValue> values =
        new List<CascadingDropDownNameValue>();

        if (reader.HasRows)
        {
            while (reader.Read())
            {
                // MessageBox.Show(reader.GetValue(0).ToString());
                values.Add(new CascadingDropDownNameValue(reader.GetValue(0).ToString(), reader.GetValue(0).ToString()));
            }
            return values.ToArray();
        }
        else
        {
            return null;
        }

    }

    [WebMethod(EnableSession = true)]
    public CascadingDropDownNameValue[] GetDropDownContents6(
      string knownCategoryValues, string category)
    {
        string connString = ConfigurationManager.ConnectionStrings["school_management_systemConnectionString"].ConnectionString;
        SqlConnection conn = new SqlConnection();
        conn.ConnectionString = connString;
        conn.Open();
        SqlCommand cmd = new SqlCommand("list_courses", conn);
        cmd.CommandType = CommandType.StoredProcedure;
       
        StringDictionary kv = CascadingDropDown.ParseKnownCategoryValuesString(knownCategoryValues);
        string makeId = kv["class2"];
        string sec = kv["sec2"];
        if (makeId.Equals(null) && sec.Equals(null))
            return null;
        cmd.Parameters.Add("@class", SqlDbType.Int).Value = makeId;
        cmd.Parameters.Add("@section", SqlDbType.VarChar).Value = sec;
        SqlDataReader reader;
        reader = cmd.ExecuteReader();
        List<CascadingDropDownNameValue> values =
        new List<CascadingDropDownNameValue>();

        if (reader.HasRows)
        {
            while (reader.Read())
            {
                // MessageBox.Show(reader.GetValue(0).ToString());
                values.Add(new CascadingDropDownNameValue(reader.GetValue(0).ToString(), reader.GetValue(0).ToString()));
            }
            return values.ToArray();
        }
        else
        {
            return null;
        }
    }
    
}
