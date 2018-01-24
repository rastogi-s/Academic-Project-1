<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"  CodeFile="onlineAdmissionRequestform.aspx.cs" Inherits="onlineAdmissionRequestform" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
    .style27
    {
            width: 266px;
        }
        .style28
        {
            width: 1065px;
        }
        .style29
        {
            width: 226px;
        }
        .style30
        {
        width: 226px;
        height: 22px;
    }
        .style31
        {
            height: 22px;
        }
        .style35
        {
            height: 70px;
            color: White;
            font-size: large;
            text-align: left;
            width: 266px;
        }
        .style36
        {
            width: 1065px;
            height: 70px;
            text-align: left;
            font-size: large;
            padding-left: 20px;
            padding-right: 30px;
        }
        .style37
        {
            width: 226px;
            height: 70px;
        }
        .style38
        {
            height: 70px;
        }
        .style39
        {
            width: 226px;
            height: 118px;
        }
        .style40
        {
            width: 266px;
            height: 118px;
            color: White;
            font-size: large;
        }
        .style41
        {
            width: 1065px;
            height: 118px;
            color: White;
            font-size: large;
        }
        .style42
        {
            height: 118px;
        }
        .style45
        {
            width: 1065px;
            height: 118px;
            text-align: left;
            color: White;
            font-size: large;
        }
        .style48
        {
            width: 1065px;
            height: 200px;
            text-align: left;
        }
        .style49
        {
            width: 226px;
            height: 200px;
        }
        .style50
        {
            width: 266px;
            height: 200px;
            color: White;
            font-size: large;
        }
        .style51
        {
            height: 200px;
        }
        #TextArea1
        {
            height: 132px;
            width: 365px;
        }
        .style52
        {
            width: 226px;
            height: 96px;
        }
        .style53
        {
            width: 266px;
            height: 96px;
            color: White;
            font-size: large;
        }
        .style54
        {
            width: 1065px;
            height: 96px;
            text-align: left;
            font-size: large;
            color: White;
        }
        .style55
        {
            height: 96px;
        }
        .style56
        {
            width: 226px;
            height: 69px;
        }
        .style59
        {
            height: 69px;
        }
        .style60
        {
            font-size: xx-large;
            text-decoration: underline;
            height: 69px;
        }
        .style61
        {
            width: 226px;
            height: 22px;
        }
        .style67
        {
            height: 69px;
            color: White;
            font-size: large;
            text-align: left;
        }
        .style73
        {
            height: 200px;
            width: 266px;
        }
        .style74
        {
            border:2px solid black;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">



    <table style="width: 100%; height: 556px;" bgcolor="White">
        <tr>
            <td class="style61">
                </td>
            <td class="style31" colspan="2">
                </td>
            <td class="style30">
               
            </td>
        </tr>
        <tr>
            <td class="style56">
                </td>
            <td  bgcolor="White" colspan="2" class="style60" style="text-align: center" >
                <strong>Online Application Form</strong></td>
            <td class="style59">
            </td>
        </tr>
        
        <tr>
            <td class="style49">
                </td>
            <td  bgcolor="White"  style="text-align: left" class="style73" valign="middle" >
             <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="false">
                    <ContentTemplate>
                <asp:Image ID="Image1" runat="server"   GenerateEmptyAlternateText="true" AlternateText="Update Student's Photo"   CssClass="style74" Height="200px" Width="200px"   />
              </ContentTemplate></asp:UpdatePanel>
                </td>
                  <td  bgcolor="White"  style="text-align: left; " class="style51" >
                      
                      
                        <asp:AsyncFileUpload ID="AsyncFileUpload1" runat="server"  
                            ErrorBackColor="Red"   UploadingBackColor="#CCFFFF" UploaderStyle="Modern"  OnUploadedComplete="complete" OnUploadedFileError="notcomplete"   
                              />
                              <asp:Button ID="btnUpload" runat="server" onclick="btnUpload_Click"  Text="Upload"   />
                         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                         <asp:Button ID="Button2" runat="server" onclick="Button2_Click" Text="Remove"  />
                         <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="false" >
                    <ContentTemplate>
                        &nbsp;&nbsp;&nbsp;
                        <br />
                        <br />
                        
                        &nbsp;<asp:Label ID="Label2" runat="server" 
                            Text="( Only jpeg/jpg Format images  and Size max 25kb)" ></asp:Label>
                        <br />
                        <br />
                        <asp:Label ID="lblMessage" runat="server"></asp:Label>
     
                        <asp:HiddenField ID="HiddenField3" runat="server" />
     
                    </ContentTemplate>
                </asp:UpdatePanel>
                <asp:HiddenField ID="HiddenField2" runat="server" />
                </td>
            <td class="style51">
                </td>
        </tr>
        
        <tr>
            <td class="style39">
                </td>
            <td class="style40" bgcolor="#B50D0D" >
                &nbsp;&nbsp;&nbsp; * Student&#39;s Name :&nbsp;</td>
            <td class="style41" bgcolor="#B50D0D">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; First Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                Middle Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                LastName<br />
                <br />
&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="TextBox1" runat="server" Height="28px" Width="157px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="TextBox2" runat="server" Height="28px" Width="158px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="TextBox3" runat="server" Height="28px" Width="157px"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ErrorMessage="(Field Cannot Be Empty)" ValidationGroup="g" 
                    ControlToValidate="TextBox1" Display="Dynamic" ></asp:RequiredFieldValidator>
            </td>
            <td class="style42" >
                &nbsp;
            </td>
        </tr>
        <tr>
            <td class="style37">
                &nbsp;</td>
            <td class="style35" bgcolor="#B50D0D">
                &nbsp;&nbsp;&nbsp;* DOB :</td>
            <td class="style36" bgcolor="#B50D0D">
            <script type="text/javascript"  >

                function ChangeCalendarView(sender, args) {

                    sender._switchMode("years", true);

                }
 
</script>
                <asp:CalendarExtender ID="CalendarExtender1" runat="server"  TargetControlID="TextBox13" OnClientShown="ChangeCalendarView" >
                </asp:CalendarExtender>
                <asp:TextBox ID="TextBox13" runat="server" Height="28px" Width="130px"></asp:TextBox>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ErrorMessage="(Field Cannot Be Empty)"  ValidationGroup="g" 
                    ControlToValidate="TextBox13" style="color: #FFFFFF" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator4" runat="server" 
                    ErrorMessage="( Must Be Above 2 yrs )" style="color: #FFFFFF" Display="Dynamic" ValidationGroup="g"
                     ControlToValidate="TextBox13" Operator="LessThanEqual"  ></asp:CompareValidator>
            </td>
            <td class="style38">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style37">
                </td>
            <td class="style35" bgcolor="#B50D0D">
                &nbsp;&nbsp;&nbsp;* Sex : </td><td class="style36" bgcolor="#B50D0D">
                <asp:RadioButton ID="RadioButton1" runat="server"  GroupName="sex" Text="Male" Checked="true" 
                    ForeColor="White" style=" margin-left:20px;"   />
                <asp:RadioButton ID="RadioButton2" runat="server" GroupName="sex" Text="Female" 
                    ForeColor="White" style="margin-left: 30px;" />
                &nbsp;&nbsp;&nbsp;&nbsp;
                <br />
            </td>
            <td class="style38">
            </td>
        </tr>
        <tr>
            <td class="style39">
                </td>
            <td class="style40" bgcolor="#B50D0D">
                &nbsp;&nbsp;* Guardian&#39;s Name :&nbsp;</td>
            <td class="style45" bgcolor="#B50D0D">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; First Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Middle Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; LastName<br />
                <br />
&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="TextBox4" runat="server" Height="28px" Width="157px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="TextBox5" runat="server" Height="28px" Width="158px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="TextBox6" runat="server" Height="28px" Width="157px"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ErrorMessage="(Field Cannot Be Empty)" ValidationGroup="g" 
                    ControlToValidate="TextBox4" Display="Dynamic"></asp:RequiredFieldValidator>
            </td>
            <td class="style42">
                </td>
        </tr>
        <tr>
            <td class="style49">
                </td>
            <td class="style50" bgcolor="#B50D0D">
                &nbsp;&nbsp;* Address :&nbsp;</td>
            <td class="style48" bgcolor="#B50D0D" style="padding-left:20px;">
                <textarea id="TextArea1" name="S1"  runat="server" rows="8" cols="40"></textarea>&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                    ErrorMessage="(Field Cannot Be Empty)" ValidationGroup="g" 
                    ControlToValidate="TextArea1" Font-Size="Large" style="color: #FFFFFF" 
                    Display="Dynamic"></asp:RequiredFieldValidator>
            </td>
            <td class="style51">
                </td>
        </tr>
        <tr>
            <td class="style37">
                &nbsp;</td>
            <td class="style35" bgcolor="#B50D0D">
                &nbsp;&nbsp; * Postal Code :&nbsp;</td>
            <td class="style36" bgcolor="#B50D0D" style="padding-left:20px;">
                <asp:TextBox ID="TextBox7" runat="server" Width="94px" MaxLength="6" 
                    Height="24px"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                    ErrorMessage="(Field Cannot Be Empty)" ValidationGroup="g" 
                    ControlToValidate="TextBox7" ForeColor="White" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" 
                    ErrorMessage="( Only digits allowed )" ControlToValidate="TextBox7" 
                    Operator="DataTypeCheck" Type="Integer" Display="Dynamic" 
                    style="color: #FFFFFF"></asp:CompareValidator>
            </td>
            <td class="style38">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style37">
                &nbsp;</td>
            <td class="style35" bgcolor="#B50D0D">
                &nbsp;&nbsp;* Phone( Mobile No.) :</td>
            <td class="style36" bgcolor="#B50D0D" style="padding-left:20px;">
                <asp:TextBox ID="TextBox8" runat="server" MaxLength="10" Width="117px" 
                    Height="24px" ></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                    ErrorMessage="(Field Cannot Be Empty)" ValidationGroup="g" 
                    ControlToValidate="TextBox8" style="color: #FFFFFF" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator5" runat="server" 
                    ControlToValidate="TextBox8" Display="Dynamic" 
                    ErrorMessage="( Only digits allowed )" Operator="DataTypeCheck" 
                    style="color: #FFFFFF" Type="Integer"></asp:CompareValidator>
            </td>
            <td class="style38">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style52">
                </td>
            <td class="style53" bgcolor="#B50D0D">
                &nbsp;&nbsp; Phone( Telephone No.) :&nbsp;</td>
            <td class="style54" bgcolor="#B50D0D">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Code&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                Number&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
                <br />
&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="TextBox9" runat="server" Height="22px" Width="54px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="TextBox10" runat="server" Height="22px" Width="122px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:CompareValidator ID="CompareValidator6" runat="server" 
                    ControlToValidate="TextBox9" Display="Dynamic" 
                    ErrorMessage="( Only digits allowed )" Operator="DataTypeCheck" 
                    style="color: #FFFFFF" Type="Integer"></asp:CompareValidator>
&nbsp;<asp:CompareValidator ID="CompareValidator7" runat="server" ControlToValidate="TextBox10" 
                    Display="Dynamic" ErrorMessage="( Only digits allowed )" 
                    Operator="DataTypeCheck" style="color: #FFFFFF" Type="Integer"></asp:CompareValidator>
                </td>
            <td class="style55">
                </td>
        </tr>
        <tr>
            <td class="style37">
                &nbsp;</td>
            <td class="style35" bgcolor="#B50D0D">
                &nbsp;&nbsp; Email-ID :&nbsp;</td>
            <td class="style36" bgcolor="#B50D0D">
                <asp:TextBox ID="TextBox11" runat="server" Width="226px" Height="24px"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </td>
            <td class="style38">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style37">
                &nbsp;</td>
            <td class="style35" bgcolor="#B50D0D">
                &nbsp;&nbsp;&nbsp; Blood Group :</td>
            <td class="style36" bgcolor="#B50D0D">
                <asp:TextBox ID="TextBox12" runat="server" Width="36px" MaxLength="3"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;
            </td>
            <td class="style38">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style37">
                </td>
            <td class="style35" bgcolor="#B50D0D">
                &nbsp;&nbsp;* Nationality :&nbsp;</td>
            <td class="style36" bgcolor="#B50D0D">
                <asp:DropDownList ID="DropDownList1" runat="server" Height="22px" Width="145px" 
                    AppendDataBoundItems="true" >
                <asp:ListItem Value="Select a Nationality">Select a Nationality</asp:ListItem>
                    <asp:ListItem>India</asp:ListItem>
                    <asp:ListItem>USA</asp:ListItem>
                    <asp:ListItem>Sri Lanka</asp:ListItem>
                    <asp:ListItem>Bangladesh</asp:ListItem>
                    <asp:ListItem>Nepal</asp:ListItem>
                    <asp:ListItem>Other</asp:ListItem>
                </asp:DropDownList>
            &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                    ErrorMessage="(Field Cannot Be Empty)" ValidationGroup="g" 
                    ControlToValidate="DropDownList1" InitialValue="Select a Nationality"  style="color: #FFFFFF" Display="Dynamic"></asp:RequiredFieldValidator>
            </td>
            <td class="style38">
                </td>
        </tr>
        <tr>
            <td class="style37">
                &nbsp;</td>
            <td class="style35" bgcolor="#B50D0D">
                &nbsp;&nbsp;* Seeking Admission in Class :&nbsp;</td>
            <td class="style36" bgcolor="#B50D0D">
                <asp:DropDownList ID="DropDownList2" runat="server" AppendDataBoundItems="true" >
                    <asp:ListItem Value="Select a Class">Select a Class</asp:ListItem>
                    <asp:ListItem Value="-1">LKG</asp:ListItem>
                    <asp:ListItem Value="0">UKG</asp:ListItem>
                    <asp:ListItem Value="1">I</asp:ListItem>
                    <asp:ListItem Value="2">II</asp:ListItem>
                    <asp:ListItem Value="3">III</asp:ListItem>
                    <asp:ListItem Value="4">IV</asp:ListItem>
                    <asp:ListItem Value="5">V</asp:ListItem>
                    <asp:ListItem Value="6">VI</asp:ListItem>
                    <asp:ListItem Value="7">VII</asp:ListItem>
                    <asp:ListItem Value="8">VIII</asp:ListItem>
                    <asp:ListItem Value="9">IX</asp:ListItem>
                    <asp:ListItem Value="10">X</asp:ListItem>
                    <asp:ListItem Value="11">XI</asp:ListItem>
                    <asp:ListItem Value="12">XII</asp:ListItem>
                </asp:DropDownList>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
                    ErrorMessage="(Field Cannot Be Empty)" ValidationGroup="g" 
                    ControlToValidate="DropDownList2" InitialValue="Select a Class" style="color: #FFFFFF" Display="Dynamic"></asp:RequiredFieldValidator>
            </td>
            <td class="style38">
                &nbsp;</td>
        </tr>
        
        <tr>
            <td class="style56">
                </td>
            <td class="style67" bgcolor="#B50D0D" colspan="2">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button 
                    ID="Button3" runat="server" Height="30px" onclick="Button3_Click"  Text="Clear All Fields" Width="114px" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button1" runat="server" Height="30px" onclick="Button1_Click"  ValidationGroup="g"
                    Text="Submit" Width="114px" />
            </td>
            <td class="style59">
                </td>
        </tr>
        <tr>
            <td class="style29">
                &nbsp;</td>
            <td class="style27">
                &nbsp;
            </td>
            <td class="style28">
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
    </table>


</asp:Content>

