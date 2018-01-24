using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using AjaxControlToolkit;
using System.Web.Script.Services;
using System.Web.Services;


public partial class _Default : System.Web.UI.Page
{

/*void Page_Init(object sender, EventArgs e)
    {
        Button3.Enabled = false;
    }*/
    protected void myCal_PreRender(object sender, EventArgs e)
    {
       // DateTime d = new DateTime();
        int min_year,max_year;
        if (DateTime.Now.Month <= 3)
        {
            min_year = DateTime.Now.Year - 1;
            max_year = DateTime.Now.Year;
        }
        else
        {
            min_year = DateTime.Now.Year ;
            max_year = DateTime.Now.Year+1;
        }

       
            if ((myCal.VisibleDate.Year == min_year && myCal.VisibleDate.Month < 5) || (myCal.VisibleDate.Year < min_year))
            {
                myCal.PrevMonthText = "";
            }
            else
            {
                myCal.PrevMonthText = "<";
            }
            if ((myCal.VisibleDate.Year == max_year && myCal.VisibleDate.Month > 2) ||
            myCal.VisibleDate.Year > max_year
            )
            {
                myCal.NextMonthText = "";
            }
            else
            {
                myCal.NextMonthText = ">";
            }
     
        
        //myCal.PrevMonthText = "<";
       // myCal.VisibleDate = DateTime.Now.AddMonths(-1);
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (DateTime.Now.Month <= 3)
            HiddenField1.Value = (Convert.ToInt16(DateTime.Now.Year) - 1).ToString();
        else
            HiddenField1.Value = DateTime.Now.Year.ToString();
        if (Session["user_id"] == null) 
        {
            Response.Redirect("Login.aspx");
        }
        if (!IsPostBack)
        {
           String str = Session["user_id"].ToString();
            string connString = ConfigurationManager.ConnectionStrings["school_management_systemConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = connString;
            conn.Open();
            SqlCommand cmd = new SqlCommand("faculty_sec_course", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@faculty_id", SqlDbType.VarChar).Value = str;
            cmd.Parameters.Add("@acad_year", SqlDbType.Int).Value = DateTime.Now.Year;
            SqlDataReader reader;
            reader = cmd.ExecuteReader();
            if (reader.HasRows)
            {
                ListItemCollection list = new ListItemCollection();
                while (reader.Read())
                {
                    ListItem l = new ListItem(reader.GetValue(0).ToString());

                    DropDownList3.Items.Add(l);

                }
                Button10.Visible = false;
            }
            else
            {
                // MessageBox.Show("heelo");
                RadioButton1.Enabled = false;
                RadioButton2.Checked = true;
                MultiView2.ActiveViewIndex = 0;
                MultiView1.Visible = false;
                DropDownList3.Enabled = false;
                DropDownList1.Enabled = true;
                DropDownList2.Enabled = true;
                DropDownList10.Enabled = true;
                Button10.Visible = true;
            }
            reader.Close();
            conn.Close();
            DropDownList1.Enabled = false;
            DropDownList2.Enabled = false;
            DropDownList10.Enabled = false;
            

        }
        
        
        
    }

    
    protected void Button1_Click(object sender, EventArgs e)
    {
       // if (DropDownList10.SelectedIndex > 0)
        //{
            MultiView1.Visible = true;
            MultiView1.ActiveViewIndex = 0;
        //}

            if (RadioButton1.Checked)
            {
                Button10.Enabled = false;
            }
            else
            {
                Button10.Enabled = true;
            }
    }
    
    protected void RadioButton1_CheckedChanged(object sender, EventArgs e)
    {
       
        MultiView2.ActiveViewIndex = 0;
        MultiView1.Visible = false;
        DropDownList3.Enabled = true;
        DropDownList1.Enabled = false;
        DropDownList2.Enabled = false;
        DropDownList10.Enabled = false;
        DropDownList1.SelectedIndex = 0;
        DropDownList7.ClearSelection();
        GridView1.Visible=false;
        GridView2.Visible=false;
        GridView3.Visible = false;
        DropDownList7.ClearSelection(); 
         myCal.SelectedDates.Clear();
         Button10.Visible = false;
       
    }
    protected void RadioButton2_CheckedChanged(object sender, EventArgs e)
    {
        MultiView2.ActiveViewIndex = 1;
        MultiView1.Visible = false;
        DropDownList3.Enabled = false;
        DropDownList1.Enabled = true;
        DropDownList2.Enabled = true;
        DropDownList10.Enabled = true;
        DropDownList3.ClearSelection();
        DropDownList7.ClearSelection();
        GridView1.Visible = false;
        GridView2.Visible=false;
        GridView3.Visible = false;
        DropDownList7.ClearSelection();   
        myCal.SelectedDates.Clear();
        Button10.Visible = true;
    }
    protected void Button5_Click(object sender, EventArgs e)
    {
        MultiView1.Visible = true;
        MultiView1.ActiveViewIndex = 1;
    }
    protected void Button7_Click(object sender, EventArgs e)
    {
        MultiView1.Visible = true;
        MultiView1.ActiveViewIndex = 1;
    }
   
  
    protected void Button3_Click(object sender, EventArgs e)
    {
        
    }


    protected void myCal_SelectionChanged(object sender, EventArgs e)
    {
       // while (DropDownList10.SelectedItem.ToString() != "course") ;
        
       
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        //ageBox.Show(DropDownList10.SelectedItem.ToString());
        //MessageBox.Show(myCal.SelectedDate.ToShortDateString());
        if (RadioButton2.Checked)
        {
            if (!DropDownList10.SelectedValue.Equals(""))
            {
                //MessageBox.Show(myCal.SelectedDate.Year.ToString());
                if (!myCal.SelectedDate.Year.ToString().Equals("1"))
                {
                    string connString = ConfigurationManager.ConnectionStrings["school_management_systemConnectionString"].ConnectionString;
                    SqlConnection conn = new SqlConnection();
                    conn.ConnectionString = connString;
                    conn.Open();
                    SqlCommand cmd = new SqlCommand("faculty_sec_attendance", conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@section", SqlDbType.VarChar).Value = DropDownList2.SelectedValue;
                    // MessageBox.Show(DropDownList2.SelectedValue);
                    cmd.Parameters.Add("@acad_year", SqlDbType.Int).Value = HiddenField1.Value.ToString();
                    cmd.Parameters.Add("@class", SqlDbType.Int).Value = DropDownList1.SelectedValue;
                    //MessageBox.Show(DropDownList1.SelectedValue);
                    cmd.Parameters.Add("@course_name", SqlDbType.VarChar).Value = DropDownList10.SelectedValue;
                    //  MessageBox.Show(DropDownList10.SelectedValue);
                    cmd.Parameters.Add("@date_", SqlDbType.Date).Value = myCal.SelectedDate;
                    SqlDataReader reader;
                    reader = cmd.ExecuteReader();
                    if (reader.HasRows)
                    {
                        GridView1.DataSource = reader;
                        GridView1.DataBind();
                        GridView1.Visible = true;
                        //  MessageBox.Show("dgxsdvdx");
                        MultiView3.ActiveViewIndex = 0;
                        MultiView3.Visible = true;
                        reader.Close();
                        conn.Close();
                    }
                    else
                    {
                        MultiView3.Visible = false;
                    }
                }
                else
                {
                    ClientScript.RegisterStartupScript(Page.GetType(), "validation",
                   "<script language$='text/javascript' src$='~/js/JScript'>alert('Date not selected')</script>");
                    GridView1.Visible = false;
                }
            }
            else
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "validation",
                    "<script language$='text/javascript' src$='~/js/JScript'>alert('Course not selected')</script>");
                GridView1.Visible = false;
            }
        }
        else if(RadioButton1.Checked && RadioButton1.Enabled)
        {
            if (!DropDownList3.SelectedItem.ToString().Equals("Course"))
            {
                if (!myCal.SelectedDate.Year.ToString().Equals("1"))
                {
                    // MessageBox.Show("inside");
                   String str= Session["user_id"].ToString();
                    string connString = ConfigurationManager.ConnectionStrings["school_management_systemConnectionString"].ConnectionString;
                    SqlConnection conn = new SqlConnection();
                    conn.ConnectionString = connString;
                    conn.Open();
                    SqlCommand cmd = new SqlCommand("faculty_classteacher_attedance", conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@faculty_id", SqlDbType.VarChar).Value = str;
                    cmd.Parameters.Add("@acad_year", SqlDbType.Int).Value = HiddenField1.Value.ToString();
                    SqlDataReader reader;
                    reader = cmd.ExecuteReader();
                    string class_ = "", section = "";
                    if (reader.HasRows)
                    {
                        reader.Read();
                        class_ = reader.GetValue(0).ToString();
                        section = reader.GetValue(1).ToString();

                    }
                    reader.Close();
                    cmd = new SqlCommand("faculty_sec_attendance", conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@section", SqlDbType.VarChar).Value = section;
                    cmd.Parameters.Add("@class", SqlDbType.VarChar).Value = class_;
                    cmd.Parameters.Add("@acad_year", SqlDbType.Int).Value = HiddenField1.Value.ToString();
                    cmd.Parameters.Add("@course_name", SqlDbType.VarChar).Value = DropDownList3.SelectedItem.ToString();
                    cmd.Parameters.Add("@date_", SqlDbType.Date).Value = myCal.SelectedDate;
                    reader = cmd.ExecuteReader();
                    if (reader.HasRows)
                    {
                        GridView1.DataSource = reader;
                        GridView1.DataBind();
                        GridView1.Visible = true;
                        //  MessageBox.Show("dgxsdvdx");
                        MultiView3.ActiveViewIndex = 0;
                        MultiView3.Visible = true;
                        reader.Close();
                        conn.Close();
                    }
                    else
                    {
                        MultiView3.Visible = false;
                    }
                }
                else
                {
                    ClientScript.RegisterStartupScript(Page.GetType(), "validation",
                   "<script language$='text/javascript' src$='~/js/JScript'>alert('Date not selected')</script>");
                    GridView1.Visible = false;
                }
            }
            else
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "validation",
                    "<script language$='text/javascript' src$='~/js/JScript'>alert('Course not selected')</script>");
                GridView1.Visible = false;
            }
        }
    }


    protected void Button9_Click(object sender, EventArgs e)
    {
        if (RadioButton2.Checked)
        {
            if (!DropDownList10.SelectedValue.Equals(""))
            {
                if (!DropDownList7.SelectedItem.ToString().Equals("Term"))
                {
                    string connString = ConfigurationManager.ConnectionStrings["school_management_systemConnectionString"].ConnectionString;
                    SqlConnection conn = new SqlConnection();
                    conn.ConnectionString = connString;
                    conn.Open();
                    SqlCommand cmd = new SqlCommand("faculty_sec_grade", conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@section", SqlDbType.VarChar).Value = DropDownList2.SelectedValue;
                    // MessageBox.Show(DropDownList2.SelectedValue);
                    cmd.Parameters.Add("@acad_year", SqlDbType.Int).Value = HiddenField1.Value.ToString(); ;
                    cmd.Parameters.Add("@class", SqlDbType.Int).Value = DropDownList1.SelectedValue;
                    //MessageBox.Show(DropDownList1.SelectedValue);
                    cmd.Parameters.Add("@course_name", SqlDbType.VarChar).Value = DropDownList10.SelectedValue;
                    //  MessageBox.Show(DropDownList10.SelectedValue);
                    cmd.Parameters.Add("@term_desc", SqlDbType.VarChar).Value = DropDownList7.SelectedItem.ToString();
                    SqlDataReader reader;
                    reader = cmd.ExecuteReader();
                    if (reader.HasRows)
                    {
                        GridView3.DataSource = reader;
                        GridView3.DataBind();
                        GridView3.Visible = true;
                        //  MessageBox.Show("dgxsdvdx");
                        MultiView1.ActiveViewIndex = 1;
                        MultiView1.Visible = true;
                        reader.Close();
                        conn.Close();
                    }
                    else
                    {
                        MultiView1.Visible = false;
                    }
                }
                else
                {
                    ClientScript.RegisterStartupScript(Page.GetType(), "validation",
                    "<script language$='text/javascript' src$='~/js/JScript'>alert('Term not selected')</script>");
                    GridView3.Visible = false;
                }

            }
            else
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "validation",
                    "<script language$='text/javascript' src$='~/js/JScript'>alert('Course not selected')</script>");
                GridView3.Visible = false;
            }
        }
        else if (RadioButton1.Checked && RadioButton1.Enabled)
        {
            if (!DropDownList3.SelectedItem.ToString().Equals("Course") )
            {
                if (!DropDownList7.SelectedItem.ToString().Equals("Term"))
                {
                    // MessageBox.Show("inside");
                    string str = Session["user_id"].ToString();
                    string connString = ConfigurationManager.ConnectionStrings["school_management_systemConnectionString"].ConnectionString;
                    SqlConnection conn = new SqlConnection();
                    conn.ConnectionString = connString;
                    conn.Open();
                    SqlCommand cmd = new SqlCommand("faculty_classteacher_attedance", conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@faculty_id", SqlDbType.VarChar).Value = str;
                    cmd.Parameters.Add("@acad_year", SqlDbType.Int).Value = HiddenField1.Value.ToString(); ;
                    SqlDataReader reader;
                    reader = cmd.ExecuteReader();
                    string class_ = "", section = "";
                    if (reader.HasRows)
                    {
                        reader.Read();
                        class_ = reader.GetValue(0).ToString();
                        section = reader.GetValue(1).ToString();

                    }
                    reader.Close();
                    cmd = new SqlCommand("faculty_sec_grade", conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@section", SqlDbType.VarChar).Value = section;
                    cmd.Parameters.Add("@acad_year", SqlDbType.Int).Value = HiddenField1.Value.ToString(); ;
                    cmd.Parameters.Add("@class", SqlDbType.Int).Value = class_;
                    cmd.Parameters.Add("@course_name", SqlDbType.VarChar).Value = DropDownList3.SelectedItem.ToString();
                    cmd.Parameters.Add("@term_desc", SqlDbType.VarChar).Value = DropDownList7.SelectedItem.ToString();
                    reader = cmd.ExecuteReader();
                    if (reader.HasRows)
                    {
                        GridView3.DataSource = reader;
                        GridView3.DataBind();
                        GridView3.Visible = true;
                        //  MessageBox.Show("dgxsdvdx");
                        MultiView1.ActiveViewIndex = 1;
                        MultiView1.Visible = true;
                        reader.Close();
                        conn.Close();
                    }
                    else
                    {
                        MultiView3.Visible = false;
                    }
                }
                else
                {
                    ClientScript.RegisterStartupScript(Page.GetType(), "validation",
                    "<script language$='text/javascript' src$='~/js/JScript'>alert('Term not selected')</script>");
                    GridView3.Visible = false;
                }
            }
            else
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "validation",
                    "<script language$='text/javascript' src$='~/js/JScript'>alert('Course not selected')</script>");
                GridView3.Visible = false;
            }
        }
    }
    protected void Button10_Click(object sender, EventArgs e)
    {
        if (RadioButton2.Checked)
        {
            if (!DropDownList10.SelectedValue.Equals(""))
            {
                if (!myCal.SelectedDate.Year.ToString().Equals("1"))
                {
                    GridView2.DataBind();
                    GridView2.Visible = true;
                    MultiView3.ActiveViewIndex = 1;
                    MultiView3.Visible = true;

                }
                else
                {
                    ClientScript.RegisterStartupScript(Page.GetType(), "validation",
                    "<script language$='text/javascript' src$='~/js/JScript'>alert('Date not selected')</script>");
                    GridView2.Visible = false;
                }
            }
            else
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "validation",
                    "<script language$='text/javascript' src$='~/js/JScript'>alert('Course not selected')</script>");
                GridView2.Visible = false;
            }
        }
        
    }
    protected void Button3_Click1(object sender, EventArgs e)
    {

        if (RadioButton2.Checked)
        {
            if (!DropDownList10.SelectedValue.Equals(""))
            {
                if (!myCal.SelectedDate.Year.ToString().Equals("1"))
                {

                    string connString = ConfigurationManager.ConnectionStrings["school_management_systemConnectionString"].ConnectionString;
                    SqlConnection conn = new SqlConnection();
                    conn.ConnectionString = connString;
                    conn.Open();
                    //  MessageBox.Show(GridView2.Rows[0].Cells[0].Text);
                    int i = 0;
                    int x = GridView2.Rows.Count;
                    int[] row1 = new int[x];
                    for (i = 0; i < GridView2.Rows.Count; i++)
                    {
                        SqlCommand cmd = new SqlCommand("insert_attendance_faculty", conn);
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.Add("@acad_year", SqlDbType.Int).Value = HiddenField1.Value.ToString(); ;
                        cmd.Parameters.Add("@course_name", SqlDbType.VarChar).Value = DropDownList10.SelectedValue;
                        cmd.Parameters.Add("@reg_no", SqlDbType.VarChar).Value = GridView2.Rows[i].Cells[0].Text;
                        cmd.Parameters.Add("@date_", SqlDbType.Date).Value = myCal.SelectedDate.ToString();
                        System.Web.UI.WebControls.CheckBox check = (System.Web.UI.WebControls.CheckBox)GridView2.Rows[i].FindControl("CheckBox1");
                        if (check.Checked)
                        {
                            cmd.Parameters.Add("@status", SqlDbType.VarChar).Value = "y";
                        }
                        else
                        {
                            cmd.Parameters.Add("@status", SqlDbType.VarChar).Value = "n";
                        }
                        SqlDataReader reader;
                        reader = cmd.ExecuteReader();
                        reader.Read();
                        row1[i] = Convert.ToInt16(reader.GetValue(0));
                        reader.Close();
                    }


                    Boolean flag = false;
                    for (int z = 0; z < GridView2.Rows.Count; z++)
                    {
                        if (row1[z] != 1)
                        {
                            string str = GridView2.Rows[z].Cells[0].Text;
                            ClientScript.RegisterStartupScript(Page.GetType(), "validation",
                            "<script language$='text/javascript' src$='~/js/JScript'>alert('Not Updated For " + str + "')</script>");
                            flag = false;
                            break;
                        }
                        flag = true;
                    }
                    if (flag == true)
                    {
                        ClientScript.RegisterStartupScript(Page.GetType(), "validation",
                            "<script language$='text/javascript' src$='~/js/JScript'>alert('Successfully Updated')</script>");
                        GridView2.Visible = false;
                       
                        MultiView3.Visible = false;
                    }

                }
                else
                {
                    ClientScript.RegisterStartupScript(Page.GetType(), "validation",
                    "<script language$='text/javascript' src$='~/js/JScript'>alert('Date not selected')</script>");
                    GridView2.Visible = false;
                }
            }
            else
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "validation",
                    "<script language$='text/javascript' src$='~/js/JScript'>alert('Course not selected')</script>");
                GridView2.Visible = false;
            }
        }
    }
}