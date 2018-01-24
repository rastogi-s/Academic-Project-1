<%@ Page Title="" Language="C#" MasterPageFile="~/childmasterStudent.master" AutoEventWireup="true" CodeFile="StudentUpdateApply.aspx.cs" Inherits="_Default" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head2" Runat="Server">
    <style type="text/css">
        .style32
        {
            height: 7px;
            text-align: left;
        }
        .style34
        {
            height: 233px;
            color:Black;
        }
        .style35
        {
             text-align:center;
        }
        .style37
        {
            height: 71px;
        }
        #TextArea4
        {
            height: 122px;
            width: 250px;
        }
        .style44
        {
            font-size: x-large;
            text-align: center;
        }
        #TextArea1
        {
            height: 142px;
            width: 260px;
        }
      
        .style48
        {
            height: 58px;
        }
        .style208
        {
            height: 172px;
        }
        .style209
        {
            height: 57px;
        }
        .style210
        {
            height: 49px;
        }
        .style212
        {
            height: 76px;
        }
        .style213
        {
            height: 79px;
        }
        .style214
        {
            height: 160px;
        }
        .style215
        {
            height: 59px;
        }
        .style216
        {
            height: 65px;
        }
        .style217
        {
            height: 64px;
        }
        .style218
        {
            height: 209px;
        }
        .style219
        {
            height: 162px;
        }
        .style220
        {
            height: 84px;
        }
        .style221
        {
            height: 179px;
        }
        .style222
        {
            height: 87px;
        }
        .style223
        {
            height: 72px;
        }
        .style224
        {
            height: 109px;
        }
        .style225
        {
            height: 68px;
        }
        .style226
        {
            height: 75px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <script type="text/javascript"  >

    function ChangeCalendarView(sender, args) {

        sender._switchMode("years", true);

    }
 
</script>


    <table style="width: 100%; height: 100%; margin-left: 0px;">
        <tr>
            <td class="style32">
                
                </td>
        </tr>
        <tr>
            <td valign="top">
                <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
                    <asp:View ID="View1" runat="server">
                    <table style="width: 100%; height:100%; color: #FFFFFF;" bgcolor="White">
       
                   <tr>
           
               <td  bgcolor="White" colspan="2" class="style35" >
                <strong style="color: #000000; font-size: x-large; text-align: center;">
                Student&#39;s Details </strong></td>
            
        </tr>
                             <tr>
                                 <td bgcolor="White" class="style34">
                                     &nbsp;&nbsp;&nbsp;<asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="false">
                    <ContentTemplate>
                <asp:Image ID="Image1" runat="server"   GenerateEmptyAlternateText="true" AlternateText="Update Student's Photo"   CssClass="style74" Height="200px" Width="200px"   />
              </ContentTemplate></asp:UpdatePanel></td>
                                 <td bgcolor="White" class="style34">
                                     <asp:AsyncFileUpload ID="AsyncFileUpload1" runat="server"  
                            ErrorBackColor="Red"   UploadingBackColor="#CCFFFF" UploaderStyle="Modern"  OnUploadedComplete="complete" OnUploadedFileError="notcomplete"   
                              />
                              <asp:Button ID="btnUpload" runat="server" onclick="btnUpload_Click"  Text="Upload"   />
                         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                         <asp:Button ID="Button4" runat="server" onclick="Button2_Click1" Text="Remove"  />
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
                                      <asp:HiddenField ID="HiddenField4" runat="server" />
                                 </td>
                             </tr>
        <tr>
            
            <td class="style208" bgcolor="#B50D0D" >
                &nbsp;&nbsp;&nbsp;* Student&#39;s Name :&nbsp;</td>
            <td class="style208" bgcolor="#B50D0D">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; First Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                Middle Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                LastName<br />
                <br />
&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="TextBox2" runat="server" Height="28px" Width="157px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="TextBox3" runat="server" Height="28px" Width="158px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="TextBox4" runat="server" Height="28px" Width="157px"></asp:TextBox>
                &nbsp;&nbsp;
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="TextBox2" Display="Dynamic" 
                    ErrorMessage="( Field Cannot Be Empty)" ValidationGroup="g"></asp:RequiredFieldValidator>
            </td>
            
        </tr>
        <tr>
            
            <td class="style209" bgcolor="#B50D0D">
                &nbsp;&nbsp;&nbsp;* DOB :</td>
            <td class="style209" bgcolor="#B50D0D">
                &nbsp;&nbsp;&nbsp;
                <asp:CalendarExtender ID="CalendarExtender1" runat="server" 
                    TargetControlID="TextBox30"  OnClientShown="ChangeCalendarView" ></asp:CalendarExtender>
                <asp:TextBox ID="TextBox30" runat="server" Height="29px" Width="100px"></asp:TextBox>
                &nbsp;&nbsp;&nbsp;
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="TextBox30" Display="Dynamic" 
                    ErrorMessage="( Field Cannot Be Empty)" ValidationGroup="g"></asp:RequiredFieldValidator>
            </td>
            
        </tr>
        <tr>
            
            <td class="style210" bgcolor="#B50D0D">
                &nbsp;&nbsp;*&nbsp;Sex :</td> 
                <td class="style210" bgcolor="#B50D0D">
                <asp:RadioButton ID="RadioButton1" runat="server"  GroupName="sex" Text="Male" 
                    ForeColor="White" style=" margin-left:20px;"  />
                <asp:RadioButton ID="RadioButton2" runat="server" GroupName="sex" Text="Female" 
                    ForeColor="White" style="margin-left: 30px;" />
                <br />
            </td>
            
        </tr>
       
        <tr>
            
            <td class="style218" bgcolor="#B50D0D">
                &nbsp;&nbsp;* Address :&nbsp;</td>
            <td class="style218" bgcolor="#B50D0D" style="padding-left:20px;">
                <textarea id="TextArea1" name="S1" rows="8" cols="25" runat="server" ></textarea>&nbsp;&nbsp;
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ControlToValidate="TextArea1" Display="Dynamic" 
                    ErrorMessage="( Field Cannot Be Empty)" ValidationGroup="g"></asp:RequiredFieldValidator>
            </td>
          
        </tr>
        <tr>
            
            <td class="style212" bgcolor="#B50D0D">
                &nbsp;&nbsp;* Postal Code :&nbsp;</td>
            <td class="style212" bgcolor="#B50D0D" style="padding-left:20px;">
                <asp:TextBox ID="TextBox7" runat="server" Width="94px" MaxLength="6" 
                    Height="24px"></asp:TextBox>
                &nbsp;&nbsp;
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                    ControlToValidate="TextBox7" Display="Dynamic" 
                    ErrorMessage="( Field Cannot Be Empty)" ValidationGroup="g"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" 
                    ControlToValidate="TextBox7" Display="Dynamic" 
                    ErrorMessage="( Only digits allowed )" Operator="DataTypeCheck" 
                    style="color: #FFFFFF" Type="Integer" ValidationGroup="g"></asp:CompareValidator>
            </td>
            
        </tr>
        <tr>
            
            <td class="style213" bgcolor="#B50D0D">
                &nbsp;&nbsp;* Phone( Mobile No.) :</td>
            <td class="style213" bgcolor="#B50D0D" style="padding-left:20px;">
                <asp:TextBox ID="TextBox8" runat="server" MaxLength="10" Width="117px" 
                    Height="24px" ></asp:TextBox>
                &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                    ControlToValidate="TextBox8" Display="Dynamic" 
                    ErrorMessage="( Field Cannot Be Empty)" ValidationGroup="g"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator2" runat="server" 
                    ControlToValidate="TextBox8" Display="Dynamic" 
                    ErrorMessage="( Only digits allowed )" Operator="DataTypeCheck" 
                    style="color: #FFFFFF" Type="Integer" ValidationGroup="g"></asp:CompareValidator>
            </td>
            
        </tr>
        <tr>
            
            <td class="style214" bgcolor="#B50D0D">
                &nbsp;&nbsp;&nbsp; Phone( Telephone No.) :&nbsp;</td>
            <td class="style214" bgcolor="#B50D0D">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Code&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                Number&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
                <br />
&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="TextBox9" runat="server" Height="22px" Width="54px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="TextBox10" runat="server" Height="22px" Width="122px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:CompareValidator ID="CompareValidator3" runat="server" 
                    ControlToValidate="TextBox9" Display="Dynamic" 
                    ErrorMessage="( Only digits allowed )" Operator="DataTypeCheck" 
                    style="color: #FFFFFF" Type="Integer" ValidationGroup="g"></asp:CompareValidator>
                <asp:CompareValidator ID="CompareValidator4" runat="server" 
                    ControlToValidate="TextBox10" Display="Dynamic" 
                    ErrorMessage="( Only digits allowed )" Operator="DataTypeCheck" 
                    style="color: #FFFFFF" Type="Integer" ValidationGroup="g"></asp:CompareValidator>
                </td>
            
        </tr>
        <tr>
            
            <td class="style215" bgcolor="#B50D0D">
                &nbsp;&nbsp; Email-ID :&nbsp;</td>
            <td class="style215" bgcolor="#B50D0D">
                &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="TextBox11" runat="server" Width="226px" Height="24px"></asp:TextBox>
            </td>
           
        </tr>
        <tr>
           
            <td class="style216" bgcolor="#B50D0D">
                &nbsp;&nbsp;&nbsp; Blood Group :</td>
            <td class="style216" bgcolor="#B50D0D">
                &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="TextBox12" runat="server" Width="36px" MaxLength="3"></asp:TextBox>
            </td>
           
        </tr>
        <tr>
            
            <td class="style37" bgcolor="#B50D0D">
                &nbsp;*&nbsp;Nationality :&nbsp;</td>
            <td class="style37" bgcolor="#B50D0D">
                &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="TextBox31" runat="server" Height="22px" Width="176px"></asp:TextBox>
                &nbsp;&nbsp;&nbsp;
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                    ControlToValidate="TextBox31" Display="Dynamic" 
                    ErrorMessage="( Field Cannot Be Empty)" ValidationGroup="g"></asp:RequiredFieldValidator>
            </td>
           
        </tr>
      
                        <tr>
                            <td bgcolor="#B50D0D"  colspan="2" style="text-align: center" class="style217">
                                &nbsp;<asp:Button ID="Button1" runat="server" Height="30px" onclick="Button1_Click" 
                                    Text="Next" Width="80px" ValidationGroup="g" />
                            </td>
                        </tr>

      
    </table>
                    </asp:View>
                    <asp:View ID="View2" runat="server">
                    
                   <table style="width: 100%; height:1115px; color: #FFFFFF;" bgcolor="White">
       
        <tr>
           
            <td  bgcolor="White" colspan="2" class="style44" >
                <strong style="color: #000000">Guardian&#39;s Details</strong></td>
            
        </tr>
        <tr>
            
            <td class="style219" bgcolor="#B50D0D" >
                &nbsp;&nbsp;* Guardian&#39;s Name :&nbsp;</td>
            <td class="style219" bgcolor="#B50D0D">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; First Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                Middle Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                LastName<br />
                <br />
&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="TextBox5" runat="server" Height="28px" Width="157px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="TextBox6" runat="server" Height="28px" Width="158px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="TextBox13" runat="server" Height="28px" Width="157px"></asp:TextBox>
                    <asp:CalendarExtender ID="CalendarExtender2" runat="server" 
                        OnClientShown="ChangeCalendarView" TargetControlID="TextBox13"></asp:CalendarExtender>
                &nbsp;&nbsp;
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                    ControlToValidate="TextBox5" Display="Dynamic" 
                    ErrorMessage="( Field Cannot Be Empty)" ValidationGroup="g"></asp:RequiredFieldValidator>
            </td>
            
        </tr>
        
        <tr>
            
            <td bgcolor="#B50D0D" class="style220">
                &nbsp;&nbsp;*&nbsp;DOB :&nbsp;
                </td>
                  <td bgcolor="#B50D0D" class="style220">
                    
                    &nbsp;&nbsp;&nbsp;
                    <asp:CalendarExtender ID="CalendarExtender3" runat="server" 
                    TargetControlID="TextBox1"  OnClientShown="ChangeCalendarView" ></asp:CalendarExtender>
                    <asp:TextBox ID="TextBox1" runat="server" Height="28px" Width="130px"></asp:TextBox>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="TextBox1" ErrorMessage="(Field Cannot Be Empty)" 
                        style="color: #FFFFFF" ValidationGroup="g" Display="Dynamic"></asp:RequiredFieldValidator>
            </td>
            </tr>
                <tr>
                    <td bgcolor="#B50D0D" class="style48">
                        &nbsp;&nbsp;*&nbsp;Sex :</td>
                        <td bgcolor="#B50D0D" class="style48">
                            <asp:RadioButton ID="RadioButton3" runat="server" ForeColor="White" 
                                GroupName="sex" style=" margin-left:20px;" Text="Male" />
                            <asp:RadioButton ID="RadioButton4" runat="server" ForeColor="White" 
                                GroupName="sex" style="margin-left: 30px;" Text="Female" />
                            <br />
                        </td>
                    
                </tr>
                <tr>
                    <td bgcolor="#B50D0D" class="style221">
                        &nbsp;&nbsp;* Address :&nbsp;</td>
                    <td bgcolor="#B50D0D" class="style221" style="padding-left:20px;">
                        <textarea ID="TextArea4" runat="server" cols="25" name="S2" rows="8"></textarea>&nbsp;&nbsp;
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                            ControlToValidate="TextArea4" Display="Dynamic" 
                            ErrorMessage="( Field Cannot Be Empty)" ValidationGroup="g"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td bgcolor="#B50D0D" class="style213">
                        &nbsp;&nbsp;* Relation :&nbsp;</td>
                    <td bgcolor="#B50D0D" class="style213" style="padding-left:20px;">
                        <asp:TextBox ID="TextBox33" runat="server" Height="24px" Width="94px"></asp:TextBox>
                    &nbsp;
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" 
                                   ControlToValidate="TextBox33" Display="Dynamic" 
                                   ErrorMessage="( Field Cannot Be Empty)" ValidationGroup="g"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td bgcolor="#B50D0D" class="style222">
                        &nbsp;&nbsp;* Postal Code :&nbsp;</td>
                    <td bgcolor="#B50D0D" class="style222" style="padding-left:20px;">
                        <asp:TextBox ID="TextBox14" runat="server" Height="24px" MaxLength="6" 
                            Width="94px"></asp:TextBox>
                    &nbsp;&nbsp;&nbsp;
                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
                    ControlToValidate="TextBox14" Display="Dynamic" 
                    ErrorMessage="( Field Cannot Be Empty)" ValidationGroup="g"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidator6" runat="server" 
                    ControlToValidate="TextBox14" Display="Dynamic" 
                    ErrorMessage="( Only digits allowed )" Operator="DataTypeCheck" 
                    style="color: #FFFFFF" Type="Integer" ValidationGroup="g"></asp:CompareValidator>
                    </td>
                </tr>
                <tr>
                    <td bgcolor="#B50D0D" class="style223">
                        &nbsp;&nbsp;* Phone( Mobile No.) :</td>
                    <td bgcolor="#B50D0D" class="style223" style="padding-left:20px;">
                        <asp:TextBox ID="TextBox15" runat="server" Height="24px" MaxLength="10" 
                            Width="117px"></asp:TextBox>
                    &nbsp;
                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" 
                    ControlToValidate="TextBox15" Display="Dynamic" 
                    ErrorMessage="( Field Cannot Be Empty)" ValidationGroup="g"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidator5" runat="server" 
                    ControlToValidate="TextBox15" Display="Dynamic" 
                    ErrorMessage="( Only digits allowed )" Operator="DataTypeCheck" 
                    style="color: #FFFFFF" Type="Integer" ValidationGroup="g"></asp:CompareValidator>
                    </td>
                </tr>
                <tr>
                    <td bgcolor="#B50D0D" class="style224">
                        &nbsp;&nbsp; Phone( Telephone No.) :&nbsp;</td>
                    <td bgcolor="#B50D0D" class="style224">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Code&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Number&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
                        <br />
                        &nbsp;&nbsp;&nbsp;
                        <asp:TextBox ID="TextBox16" runat="server" Height="22px" Width="54px"></asp:TextBox>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:TextBox ID="TextBox17" runat="server" Height="22px" Width="122px"></asp:TextBox>
                        &nbsp;&nbsp;&nbsp;<asp:CompareValidator ID="CompareValidator7" runat="server" 
                    ControlToValidate="TextBox16" Display="Dynamic" 
                    ErrorMessage="( Only digits allowed )" Operator="DataTypeCheck" 
                    style="color: #FFFFFF" Type="Integer" ValidationGroup="g"></asp:CompareValidator>
                <asp:CompareValidator ID="CompareValidator8" runat="server" 
                    ControlToValidate="TextBox17" Display="Dynamic" 
                    ErrorMessage="( Only digits allowed )" Operator="DataTypeCheck" 
                    style="color: #FFFFFF" Type="Integer" ValidationGroup="g"></asp:CompareValidator>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td bgcolor="#B50D0D" class="style225">
                        &nbsp;&nbsp; Email-ID :&nbsp;</td>
                    <td bgcolor="#B50D0D" class="style225">
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:TextBox ID="TextBox18" runat="server" Height="24px" Width="226px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td bgcolor="#B50D0D" class="style226">
                        &nbsp;* Nationality :&nbsp;</td>
                    <td bgcolor="#B50D0D" class="style226">
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:TextBox ID="TextBox32" runat="server" Height="24px" Width="196px"></asp:TextBox>
                    &nbsp;&nbsp;&nbsp;
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" 
                                   ControlToValidate="TextBox32" Display="Dynamic" 
                                   ErrorMessage="( Field Cannot Be Empty)" ValidationGroup="g"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td bgcolor="#B50D0D" colspan="2" style="text-align: center">
                        <asp:Button ID="Button2" runat="server" Height="29px" onclick="Button2_Click" 
                            Text="Back" Width="81px" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="Button3" runat="server" Height="29px" onclick="Button3_Click" 
                            Text="Update" Width="81px" ValidationGroup="g" />
                    </td>
                </tr>
            
    </table>
    </asp:View>
                </asp:MultiView>
            </td>
        </tr>
    </table>

</asp:Content>

