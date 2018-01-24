﻿<%@ Page Title="" Language="C#" MasterPageFile="~/childmasterStaff.master" AutoEventWireup="true" CodeFile="FacultyProfUpdate.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head3" Runat="Server">
    <style type="text/css">
        
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
    
        .style46
        {
            height: 134px;
        }
        .style47
        {
            height: 54px;
        }
        .style48
        {
            height: 40px;
            text-align: center;
        }
        .style201
        {
            height: 184px;
        }
        .style202
        {
            height: 48px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">
    
    <script type="text/javascript"  >

        function ChangeCalendarView(sender, args) {

            sender._switchMode("years", true);

        }
 
</script>
         <table style="width: 101%; height:1306px; color: #FFFFFF; margin-bottom: 0px;" 
    bgcolor="White">
       
        <tr>
           
            <td  bgcolor="White" colspan="2" class="style43" align="center" >
                 &nbsp;<strong style="color: #000000; text-align: center;"><span class="style29">Faculty&#39;s Profile</span></strong></td>
            
        </tr>
                             <tr>
                                 <td bgcolor="White" class="style48" colspan="2">
                                     <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
                                         Height="22px" onselectedindexchanged="DropDownList1_SelectedIndexChanged" 
                                         Width="101px">
                                         
                                     </asp:DropDownList>
                                 </td>
                             </tr>
                             <tr>
                                 <td bgcolor="White" class="style46">
                                     &nbsp;&nbsp;&nbsp;<img id="Img1" runat="server" alt="" style="height:200px; width: 174px; margin-top: 8px;" /></td>
                                 <td bgcolor="White" class="style46">
                                 </td>
                             </tr>
        <tr>
            
            <td class="style41" bgcolor="#B50D0D" >
                &nbsp;&nbsp;*&nbsp;Faculty&#39;s Name :&nbsp;</td>
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
            &nbsp;&nbsp;&nbsp;
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ErrorMessage="(Field Cannot Be Empty)" ValidationGroup="g" 
                    ControlToValidate="TextBox1" Display="Dynamic" ></asp:RequiredFieldValidator>
            </td>
            
        </tr>
        <tr>
            
            <td class="style33" bgcolor="#B50D0D">
                &nbsp;&nbsp;*&nbsp;DOB :</td>
            <td class="style33" bgcolor="#B50D0D">
                &nbsp;&nbsp;&nbsp;
                
                <asp:CalendarExtender ID="CalendarExtender2" runat="server" 
                    TargetControlID="TextBox30" OnClientShown="ChangeCalendarView">
                </asp:CalendarExtender>
                <asp:TextBox ID="TextBox30" runat="server" Height="29px" Width="100px" ></asp:TextBox>
                &nbsp;&nbsp;&nbsp;
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ErrorMessage="(Field Cannot Be Empty)"  ValidationGroup="g" 
                    ControlToValidate="TextBox30" style="color: #FFFFFF" Display="Dynamic"></asp:RequiredFieldValidator>
            </td>
            
        </tr>
        <tr>
            
            <td class="style34" bgcolor="#B50D0D">
                &nbsp;&nbsp;*&nbsp;Sex :</td> <td class="style34" bgcolor="#B50D0D">
                <asp:RadioButton ID="RadioButton1" runat="server"  GroupName="sex" Text="Male" 
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
                <textarea id="TextArea1" name="S1" rows="8" cols="25" runat="server" ></textarea>&nbsp;&nbsp;&nbsp;
                <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" 
                    ErrorMessage="(Field Cannot Be Empty)" ValidationGroup="g" 
                    ControlToValidate="TextArea1"  style="color: #FFFFFF" 
                    Display="Dynamic"></asp:RequiredFieldValidator>
            </td>
          
        </tr>
        <tr>
            
            <td class="style35" bgcolor="#B50D0D">
                &nbsp;&nbsp;* Postal Code :&nbsp;</td>
            <td class="style35" bgcolor="#B50D0D" style="padding-left:20px;">
                <asp:TextBox ID="TextBox7" runat="server" Width="94px" MaxLength="6" 
                    Height="24px"></asp:TextBox>
            &nbsp;&nbsp;
                <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" 
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
            &nbsp;&nbsp;
                <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" 
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
            </td>
           
        </tr>
        <tr>
           
            <td class="style38" bgcolor="#B50D0D">
                &nbsp;&nbsp;&nbsp; Blood Group :</td>
            <td class="style38" bgcolor="#B50D0D">
                &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="TextBox12" runat="server" Width="36px" MaxLength="3"></asp:TextBox>
            </td>
           
        </tr>
        <tr>
            
            <td class="style39" bgcolor="#B50D0D">
                &nbsp;*&nbsp;Nationality :&nbsp;</td>
            <td class="style39" bgcolor="#B50D0D">
                &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="TextBox33" runat="server" Height="29px" Width="198px"></asp:TextBox>
                <asp:CalendarExtender ID="TextBox33_CalendarExtender" runat="server" 
                    TargetControlID="TextBox33">
                </asp:CalendarExtender>
            &nbsp;
                <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" 
                    ErrorMessage="(Field cannot be empty)" ValidationGroup="g" 
                    ControlToValidate="TextBox33"></asp:RequiredFieldValidator>
            </td>
           
        </tr>
      
        <tr>
            
            <td class="style47" bgcolor="#B50D0D">
                &nbsp;* Date Of Joining&nbsp;:</td>
            <td class="style47" bgcolor="#B50D0D">
                &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:CalendarExtender ID="CalendarExtender3" runat="server" 
                    TargetControlID="TextBox31" OnClientShown="ChangeCalendarView">
                </asp:CalendarExtender>
                <asp:TextBox ID="TextBox31" runat="server" Height="29px" Width="100px"  ></asp:TextBox>
                &nbsp;&nbsp;
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                    ErrorMessage="(Field cannot be empty)" ValidationGroup="g" 
                    ControlToValidate="TextBox31"></asp:RequiredFieldValidator>
                </td>
           
        </tr>
      
        <tr>
            
            <td class="style201" bgcolor="#B50D0D">
                &nbsp;&nbsp;* Qualification :&nbsp;</td>
            <td class="style201" bgcolor="#B50D0D">
                &nbsp;&nbsp;&nbsp;&nbsp;
                <textarea id="TextArea2" name="S2" runat="server"  rows="8" cols="25" ></textarea>&nbsp; &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
                    ErrorMessage="(Field cannot be empty)" ValidationGroup="g" 
                    ControlToValidate="TextArea2"></asp:RequiredFieldValidator>

                </td>
           
        </tr>
      
        <tr>
            
            <td  bgcolor="#B50D0D" colspan="2" style="text-align: center" class="style202">
                <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Update" 
                    Width="107px" ValidationGroup="g" />
            </td>
           
        </tr>
      
    </table>
</asp:Content>

