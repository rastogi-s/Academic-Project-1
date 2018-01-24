using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
//using System.Windows.Forms;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        HiddenField1.Value = DateTime.Now.Year.ToString();
        //
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        GridView1.DataBind();
        if (!DropDownList3.SelectedValue.Equals(""))
        {
            if (DropDownList4.SelectedIndex > 0)
            {
                MultiView1.ActiveViewIndex = 0;
                GridView1.Visible = true;
                Button2.Visible = true;
            }
            else
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "validation",
                "<script language$='text/javascript' src$='~/js/JScript'>alert('Term not selected')</script>");
                GridView1.Visible = false;
                MultiView1.ActiveViewIndex = -1;
                Button2.Visible = false;

            }
        }
        else
        {
            ClientScript.RegisterStartupScript(Page.GetType(), "validation",
                "<script language$='text/javascript' src$='~/js/JScript'>alert('Course not selected')</script>");
            GridView1.Visible = false;
            MultiView1.ActiveViewIndex = -1;
            Button2.Visible = false;
        }
    }


    protected void Button2_Click(object sender, EventArgs e)
    {
        // MessageBox.Show( Convert.ToDecimal(TextBox4.Text).GetType().ToString());
        /*   if(((Convert.ToDecimal(TextBox4.Text).GetType().ToString().Equals("System.Decimal"))) && (Convert.ToDecimal(TextBox5.Text).GetType().ToString().Equals("System.Decimal")) && (Convert.ToDecimal(TextBox6.Text).GetType().ToString().Equals("System.Decimal")))
           {
               Boolean f=false;
               for(int k=0;k < GridView1.Rows.Count; k++)
               {
                    System.Web.UI.WebControls.TextBox txt1 = (System.Web.UI.WebControls.TextBox)GridView1.Rows[k].FindControl("TextBox1");
                    System.Web.UI.WebControls.TextBox txt2 = (System.Web.UI.WebControls.TextBox)GridView1.Rows[k].FindControl("TextBox2");
                    System.Web.UI.WebControls.TextBox txt3 = (System.Web.UI.WebControls.TextBox)GridView1.Rows[k].FindControl("TextBox3");
                   if(((Convert.ToDecimal(txt1.Text).GetType().ToString().Equals("System.Decimal"))|| txt1.Text.Equals("")) && ((Convert.ToDecimal(txt2.Text).GetType().ToString().Equals("System.Decimal"))|| txt1.Text.Equals("")) && ((Convert.ToDecimal(txt3.Text).GetType().ToString().Equals("System.Decimal")) || txt1.Text.Equals("")))
                   {
                       f=true;
                   }
                   else
                   {
                       f=false;
                       break;
                   }
                
               }
               if(f)
               {

               }
               else
               {
                   ClientScript.RegisterStartupScript(Page.GetType(), "validation",
                   "<script language$='text/javascript' src$='~/js/JScript'>alert('Only Decimal numbers Upto 2 decimal places Allowed  ')</script>");
               return ;
               }
           }
           else
           {
               ClientScript.RegisterStartupScript(Page.GetType(), "validation",
                   "<script language$='text/javascript' src$='~/js/JScript'>alert('Only Decimal numbers Upto 2 decimal places Allowed  ')</script>");
               return ;
           }*/


       
        string connString = ConfigurationManager.ConnectionStrings["school_management_systemConnectionString"].ConnectionString;
        SqlConnection conn = new SqlConnection();
        conn.ConnectionString = connString;
        conn.Open();
        //  MessageBox.Show(GridView1.Rows[0].Cells[0].Text);
        int i = 0;
        int x = GridView1.Rows.Count;
        int[] row1 = new int[x];
        for (i = 0; i < GridView1.Rows.Count; i++)
        {
            SqlCommand cmd = new SqlCommand("insert_grade", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            // cmd.Parameters.Add("@section", SqlDbType.VarChar).Value = DropDownList2.SelectedValue;
            // MessageBox.Show(DropDownList2.SelectedValue);
            cmd.Parameters.Add("@acad_year", SqlDbType.Int).Value = Convert.ToInt32(DateTime.Now.Year);
            // cmd.Parameters.Add("@class", SqlDbType.Int).Value = DropDownList1.SelectedValue;
            cmd.Parameters.Add("@course_name", SqlDbType.VarChar).Value = DropDownList3.SelectedValue;
            
            cmd.Parameters.Add("@reg_no", SqlDbType.VarChar).Value = GridView1.Rows[i].Cells[0].Text;
            decimal test,theory,pract,full_test,full_theory,full_pract,total,total_full,percent;
            cmd.Parameters.Add("@full_theory", SqlDbType.Decimal).Value =full_test= Convert.ToDecimal(TextBox5.Text);
            cmd.Parameters.Add("@full_test", SqlDbType.Decimal).Value =full_theory= Convert.ToDecimal(TextBox4.Text);
            cmd.Parameters.Add("@full_practical", SqlDbType.Decimal).Value =full_pract= Convert.ToDecimal(TextBox6.Text);
            System.Web.UI.WebControls.TextBox txt1 = (System.Web.UI.WebControls.TextBox)GridView1.Rows[i].FindControl("TextBox1");
            System.Web.UI.WebControls.TextBox txt2 = (System.Web.UI.WebControls.TextBox)GridView1.Rows[i].FindControl("TextBox2");
            System.Web.UI.WebControls.TextBox txt3 = (System.Web.UI.WebControls.TextBox)GridView1.Rows[i].FindControl("TextBox3");
           // MessageBox.Show(txt1.Text);
            
            if(!txt1.Text.ToString().Equals(""))
            cmd.Parameters.Add("@test_marks", SqlDbType.Decimal).Value = test= Convert.ToDecimal(txt1.Text);
            else
                cmd.Parameters.Add("@test_marks", SqlDbType.Decimal).Value =test= 0;
            if (!txt2.Text.ToString().Equals(""))
                cmd.Parameters.Add("@theory", SqlDbType.Decimal).Value = theory=Convert.ToDecimal(txt2.Text);
            else
                cmd.Parameters.Add("@theory", SqlDbType.Decimal).Value = theory=0;
            if (!txt3.Text.ToString().Equals(""))
                cmd.Parameters.Add("@practical", SqlDbType.Decimal).Value = pract=Convert.ToDecimal(txt3.Text);
            else
                cmd.Parameters.Add("@practical", SqlDbType.Decimal).Value =pract= 0;
            string grade="";
            total = test + theory + pract;
            total_full = full_pract + full_test + full_theory;
            percent = (total / total_full) * 100;
           // MessageBox.Show(percent.ToString());
            if (percent >= 90)
                grade = "A";
            if (percent < 90 && percent >= 80)
                grade = "B";
            if (percent < 80 && percent >= 70)
                grade = "C";
            if (percent < 70 && percent >= 60)
                grade = "D";
            if (percent <= 50 )
                grade = "F";
         //   MessageBox.Show(grade);
            cmd.Parameters.Add("@grades", SqlDbType.VarChar).Value = grade;
            cmd.Parameters.Add("@term_desc", SqlDbType.VarChar).Value = DropDownList4.SelectedItem.ToString();
            SqlDataReader reader;
            reader = cmd.ExecuteReader();
            reader.Read();
            row1[i] = Convert.ToInt16(reader.GetValue(0));
            reader.Close();
        }
        Boolean flag = false;
        for (int z = 0; z < GridView1.Rows.Count; z++)
        {
            if (row1[z] != 1)
            {
                string str = GridView1.Rows[z].Cells[0].Text;
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
           // clearallcontrols(Page);
        }
    }

    protected void clearallcontrols(System.Web.UI.Control parent)
    {
        foreach (System.Web.UI.Control c in parent.Controls)
        {
            if (c is TextBox)
                ((TextBox)(c)).Text = "";
            if (c is RadioButton)
                ((RadioButton)(c)).Checked = false;
           

            clearallcontrols(c);

        }
        DropDownList1.SelectedIndex = 0;
        //DropDownList2.SelectedIndex = 0;
        //DropDownList3.SelectedIndex = 0;
        MultiView1.ActiveViewIndex = -1;
        GridView1.Visible = false;
        Button2.Visible = false;

    }

    protected void ontext(object sender, EventArgs e)
    {
        for (int i = 0; i < GridView1.Rows.Count; i++)
        {
            System.Web.UI.WebControls.CompareValidator cv = (System.Web.UI.WebControls.CompareValidator)GridView1.Rows[i].FindControl("CompareValidator7");
            cv.ValueToCompare = TextBox4.Text;
        }
      
        TextBox5.Focus();
    }

    protected void ontext1(object sender, EventArgs e)
    {
        for (int i = 0; i < GridView1.Rows.Count; i++)
        {
            System.Web.UI.WebControls.CompareValidator cv = (System.Web.UI.WebControls.CompareValidator)GridView1.Rows[i].FindControl("CompareValidator9");
            cv.ValueToCompare = TextBox5.Text;
          // MessageBox.Show(cv.ValueToCompare);
        }
        TextBox6.Focus();
        
    }


    protected void ontext2(object sender, EventArgs e)
    {
        for (int i = 0; i < GridView1.Rows.Count; i++)
        {
            System.Web.UI.WebControls.CompareValidator cv = (System.Web.UI.WebControls.CompareValidator)GridView1.Rows[i].FindControl("CompareValidator8");
            cv.ValueToCompare = TextBox6.Text;
        }
        GridView1.Focus();
       
    }
}
