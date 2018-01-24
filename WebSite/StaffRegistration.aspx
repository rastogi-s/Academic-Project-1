<%@ Page Title="" Language="C#" MasterPageFile="~/childmasterStaff.master" AutoEventWireup="true" CodeFile="StaffRegistration.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head3" Runat="Server">
    <style type="text/css">
        .style100
        {
            font-size: x-large;
        }
        .style30
        {
            height: 173px;
        }
        .style33
        {
            height: 64px;
        }
        .style34
        {
            height: 43px;
        }
        #TextArea1
        {
            height: 127px;
            width: 215px;
        }
        .style35
        {
            height: 57px;
        }
        .style36
        {
            height: 65px;
        }
        .style37
        {
            height: 62px;
        }
        .style38
        {
            height: 52px;
        }
        .style39
        {
            height: 50px;
        }
        .style41
        {
            height: 120px;
        }
        .style42
        {
            height: 91px;
        }
        .style43
        {
            height: 34px;
        }
          .style45
        {
            height: 55px;
        }
    .style46
    {
        height: 134px;
    }
        .style47
        {
            height: 54px;
        }
        .style201
        {
            height: 178px;
        }
        .style202
        {
            height: 101px;
        }
        .style203
        {
            height: 56px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">
    
         <table style="width: 101%; height:1254px; color: #FFFFFF;" bgcolor="White">
       
        <tr>
           
            <td  bgcolor="White" colspan="2" class="style43" align="center" >
                 <strong style="color: #000000; text-align: center;"><span class="style100">Staff&#39;s 
                 Details</span></strong></td>
            
        </tr>
                             <tr>
                                 <td bgcolor="White" class="style46">
                                     &nbsp;&nbsp;&nbsp;
                                     <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="false">
                    <ContentTemplate>
                <asp:Image ID="Image1" runat="server"   GenerateEmptyAlternateText="true" AlternateText="Update Faculty's Photo"   CssClass="style74" Height="200px" Width="200px"   />
              </ContentTemplate></asp:UpdatePanel></td>
              
              <td bgcolor="White" class="style46">
                                     <asp:AsyncFileUpload ID="AsyncFileUpload1" runat="server"  
                            ErrorBackColor="Red"   UploadingBackColor="#CCFFFF" UploaderStyle="Modern"  OnUploadedComplete="complete" OnUploadedFileError="notcomplete"   
                              />
                              <asp:Button ID="btnUpload" runat="server" onclick="btnUpload_Click"  Text="Upload"   />
                         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                         <asp:Button ID="Button2" runat="server" onclick="Button2_Click" Text="Remove"  />
                         <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="false" >
                    <ContentTemplate>
                        &nbsp;&nbsp;&nbsp;
                        <br />
                        <br />
                        
                        &nbsp;<asp:Label ID="Label2" runat="server" 
                            Text="( Only jpeg/jpg Format images  and Size max 25kb)" ForeColor="Black" ></asp:Label>
                        <br />
                        <br />
                        <asp:Label ID="lblMessage" runat="server" ForeColor="Black" ></asp:Label>
     
                        <asp:HiddenField ID="HiddenField3" runat="server" />
     
                    </ContentTemplate>
                </asp:UpdatePanel>
                <asp:HiddenField ID="HiddenField2" runat="server" />
                                 </td>
                             </tr>
        <tr>
            
            <td class="style41" bgcolor="#B50D0D" >
                &nbsp;&nbsp;&nbsp;* Staff&#39;s Name :&nbsp;</td>
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
            &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ErrorMessage="(Field Cannot Be Empty)" ValidationGroup="g" 
                    ControlToValidate="TextBox1" Display="Dynamic" ></asp:RequiredFieldValidator>
            </td>
            
        </tr>
        <tr>
            
            <td class="style33" bgcolor="#B50D0D">
                &nbsp;&nbsp;* DOB :</td>
            <td class="style33" bgcolor="#B50D0D">
                &nbsp;&nbsp;&nbsp;
                
                <asp:CalendarExtender ID="CalendarExtender2" runat="server" 
                    TargetControlID="TextBox30" OnClientShown="ChangeCalendarView" >
                </asp:CalendarExtender>
                <asp:TextBox ID="TextBox30" runat="server" Height="29px" Width="100px" ></asp:TextBox>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" 
                    ErrorMessage="(Field Cannot Be Empty)" ValidationGroup="g" 
                    ControlToValidate="TextBox1" Display="Dynamic" ></asp:RequiredFieldValidator>
                    <script type="text/javascript"  >

                        function ChangeCalendarView(sender, args) {

                            sender._switchMode("years", true);

                        }
 
</script>
            </td>
            
        </tr>
        <tr>
            
            <td class="style34" bgcolor="#B50D0D">
                &nbsp;&nbsp;*&nbsp;Sex :</td> <td class="style34" bgcolor="#B50D0D">
                <asp:RadioButton ID="RadioButton1" runat="server"  GroupName="sex" Text="Male" Checked="true" 
                    ForeColor="White" style=" margin-left:20px;"  />
                <asp:RadioButton ID="RadioButton2" runat="server" GroupName="sex" Text="Female" 
                    ForeColor="White" style="margin-left: 30px;" />
                <br />
            </td>
            
        </tr>
       
        <tr>
            
            <td class="style30" bgcolor="#B50D0D">
                &nbsp;&nbsp;* Address :&nbsp;</td>
            <td class="style30" bgcolor="#B50D0D" style="padding-left:20px;">
                <textarea id="TextArea1" name="S1"  rows="8" cols="25" runat="server"></textarea>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" 
                    ErrorMessage="(Field Cannot Be Empty)" ValidationGroup="g" 
                    ControlToValidate="TextArea1"  style="color: #FFFFFF" 
                    Display="Dynamic"></asp:RequiredFieldValidator>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </td>
          
        </tr>
        <tr>
            
            <td class="style35" bgcolor="#B50D0D">
                &nbsp;&nbsp;* Postal Code :&nbsp;</td>
            <td class="style35" bgcolor="#B50D0D" style="padding-left:20px;">
                <asp:TextBox ID="TextBox7" runat="server" Width="94px" MaxLength="6" 
                    Height="24px"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" 
                    ErrorMessage="(Field Cannot Be Empty)" ValidationGroup="g" 
                    ControlToValidate="TextBox7" ForeColor="White" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" 
                    ErrorMessage="( Only digits allowed )" ControlToValidate="TextBox7" 
                    Operator="DataTypeCheck" Type="Integer" Display="Dynamic" 
                    style="color: #FFFFFF" ValidationGroup="g"></asp:CompareValidator>
            </td>
            
        </tr>
        <tr>
            
            <td class="style36" bgcolor="#B50D0D">
                &nbsp;&nbsp;* Phone( Mobile No.) :</td>
            <td class="style36" bgcolor="#B50D0D" style="padding-left:20px;">
                <asp:TextBox ID="TextBox8" runat="server" MaxLength="10" Width="117px" 
                    Height="24px" ></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" 
                    ErrorMessage="(Field Cannot Be Empty)" ValidationGroup="g" 
                    ControlToValidate="TextBox8" style="color: #FFFFFF" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator5" runat="server" 
                    ControlToValidate="TextBox8" Display="Dynamic" 
                    ErrorMessage="( Only digits allowed )" Operator="DataTypeCheck" 
                    style="color: #FFFFFF" Type="Integer" ValidationGroup="g"></asp:CompareValidator>
            </td>
            
        </tr>
        <tr>
            
            <td class="style42" bgcolor="#B50D0D">
                &nbsp;&nbsp; Phone( Telephone No.) :&nbsp;</td>
            <td class="style42" bgcolor="#B50D0D">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Code&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                Number&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <br />
&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="TextBox9" runat="server" Height="22px" Width="54px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="TextBox10" runat="server" Height="22px" Width="122px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:CompareValidator ID="CompareValidator6" runat="server" 
                    ControlToValidate="TextBox9" Display="Dynamic" 
                    ErrorMessage="( Only digits allowed )" Operator="DataTypeCheck" 
                    style="color: #FFFFFF" Type="Integer" ValidationGroup="g"></asp:CompareValidator>
                <asp:CompareValidator ID="CompareValidator7" runat="server" 
                    ControlToValidate="TextBox10" Display="Dynamic" 
                    ErrorMessage="( Only digits allowed )" Operator="DataTypeCheck" 
                    style="color: #FFFFFF" Type="Integer" ValidationGroup="g"></asp:CompareValidator>
                </td>
            
        </tr>
        <tr>
            
            <td class="style37" bgcolor="#B50D0D">
                &nbsp;&nbsp; Email-ID :&nbsp;</td>
            <td class="style37" bgcolor="#B50D0D">
                &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="TextBox11" runat="server" Width="226px" Height="24px"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;
               
                </td>
           
        </tr>
        <tr>
           
            <td class="style38" bgcolor="#B50D0D">
                &nbsp;&nbsp; Blood Group :</td>
            <td class="style38" bgcolor="#B50D0D">
                &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="TextBox12" runat="server" Width="36px" MaxLength="3"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               
                </td>
           
        </tr>
        <tr>
            
            <td class="style39" bgcolor="#B50D0D">
                &nbsp;&nbsp;* Nationality :&nbsp;</td>
            <td class="style39" bgcolor="#B50D0D">
                &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:DropDownList ID="DropDownList1" runat="server" Height="24px" Width="145px" 
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
                <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" 
                    ErrorMessage="(Field Cannot Be Empty)" ValidationGroup="g" 
                    ControlToValidate="DropDownList1" InitialValue="Select a Nationality"  
                    style="color: #FFFFFF" Display="Dynamic"></asp:RequiredFieldValidator>
            </td>
           
        </tr>
      
        <tr>
            
            <td class="style47" bgcolor="#B50D0D">
                &nbsp;&nbsp;* Date Of Joining&nbsp;:</td>
            <td class="style47" bgcolor="#B50D0D">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="TextBox31" runat="server" Height="27px" Width="100px"></asp:TextBox>
                <asp:CalendarExtender ID="CalendarExtender3" runat="server" 
                    TargetControlID="TextBox31" OnClientShown="ChangeCalendarView" >
                </asp:CalendarExtender>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                    ErrorMessage="(Field cannot be empty)" ValidationGroup="g" 
                    ControlToValidate="TextBox31"></asp:RequiredFieldValidator>
            </td>
           
        </tr>
      
        <tr>
            
            <td class="style201" bgcolor="#B50D0D">
                &nbsp;&nbsp;* Qualification :&nbsp;</td>
            <td class="style201" bgcolor="#B50D0D">
                &nbsp;&nbsp;&nbsp;<textarea id="TextArea2" name="S2" runat="server"  rows="8" cols="25" ></textarea>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
                    ErrorMessage="(Field cannot be empty)" ValidationGroup="g" 
                    ControlToValidate="TextArea2"></asp:RequiredFieldValidator>
            </td>
           
        </tr>
      
        <tr>
            
            <td class="style202" bgcolor="#B50D0D">
                &nbsp;&nbsp;*&nbsp; Department :&nbsp;</td>
            <td class="style202" bgcolor="#B50D0D">
                
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate >
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   
                <asp:DropDownList ID="DropDownList2" runat="server" Height="30px" Width="157px" 
                    DataSourceID="SqlDataSource1" DataTextField="dept_name" 
                    DataValueField="dept_name" 
                    onselectedindexchanged="DropDownList2_SelectedIndexChanged" 
                    AutoPostBack="True" AppendDataBoundItems="true">
                 <asp:ListItem>Select Department</asp:ListItem>
                </asp:DropDownList>
                        
                &nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:DropDownList ID="DropDownList3" 
                    runat="server" Height="31px" Width="159px" Visible="false">
                    <asp:ListItem>Select a Manager</asp:ListItem>
                    <asp:ListItem>Student Manager</asp:ListItem>
                    <asp:ListItem>Faculty Manager</asp:ListItem>
                    <asp:ListItem>Staff Manager</asp:ListItem>
                    <asp:ListItem>Exam Manager</asp:ListItem>
                </asp:DropDownList>
                &nbsp;&nbsp;
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"  Display="Dynamic" ErrorMessage="(Select a Department) " ValidationGroup="g"
                         ControlToValidate="DropDownList2" InitialValue="Select Department"></asp:RequiredFieldValidator>
                &nbsp;&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"  Display="Dynamic" ErrorMessage="(Select a Manger) " ValidationGroup="g"
                         ControlToValidate="DropDownList3" InitialValue="Select a Manager"></asp:RequiredFieldValidator>
                 </ContentTemplate><Triggers></Triggers>
                </asp:UpdatePanel>
               
                &nbsp;&nbsp;
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:school_management_systemConnectionString %>" 
                    SelectCommand="SELECT [dept_name] FROM [department]"></asp:SqlDataSource>
                &nbsp;</td>
           
        </tr>
      
        <tr>
            
            <td bgcolor="#B50D0D" colspan="2" class="style203" style="text-align: center">
                <asp:Button ID="Button3" runat="server" Height="32px" Text="Clear Fields" 
                    Width="102px" onclick="Button3_Click"  />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button1" runat="server" Height="32px" Text="Submit" 
                    Width="102px" onclick="Button1_Click" ValidationGroup="g" />
            </td>
           
        </tr>
      
    </table>
</asp:Content>

