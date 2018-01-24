<%@ Page Title="" Language="C#" MasterPageFile="~/childmasterStudent.master" AutoEventWireup="true" CodeFile="ResetPassStudent.aspx.cs" Inherits="Default4" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head2" Runat="Server">
    <style type="text/css">
       
        .style29
        {
            background-color:#b50d0d;
            width: 209px;
        }
        .style30
        {
            background-color: #b50d0d;
            width: 137px;
            text-align: left;
            color: #FFFFFF;
            font-weight: 700;
        }
        .style31
        {
            font-size: medium;
            }
        .style46
        {
            height: 41px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    &nbsp;&nbsp;&nbsp;&nbsp;
    <table style="width: 100%; height: 497px; text-align: left; margin-left=30px">
        <tr>
            <td style="text-align: left; vertical-align:top; margin-top:30px; margin-left=30px; padding-left:180px ">
                &nbsp;
                <table style="width: 678px; height: 286px;  " 
                    align="left">
                    <tr>
                        <td class="style30">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong><span class="style31">&nbsp;Old 
                            Password:</span></strong></td>
                        <td class="style29">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:TextBox ID="TextBox1" runat="server" Height="21px" Width="166px" TextMode=Password></asp:TextBox>
                        &nbsp;&nbsp;&nbsp;
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ForeColor="#ffffff"
                                ErrorMessage="(Field cannot be empty)"  ValidationGroup="g" ControlToValidate="TextBox1" ></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style30">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; New Password:</td>
                        <td class="style29">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:TextBox ID="TextBox2" runat="server" Height="21px" Width="166px" TextMode="Password"></asp:TextBox>
                            &nbsp;&nbsp;&nbsp;
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ForeColor="#ffffff"
                                ErrorMessage="(Field cannot be empty)"   ValidationGroup="g" ControlToValidate="TextBox2" ></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style30">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Confirm Password:</td>
                        <td class="style29">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:TextBox ID="TextBox3" runat="server" Height="21px" Width="166px" TextMode="Password"></asp:TextBox>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ForeColor="#ffffff"
                                ErrorMessage="(Field cannot be empty)"  ValidationGroup="g" ControlToValidate="TextBox3" ></asp:RequiredFieldValidator>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:CompareValidator ID="CompareValidator1" runat="server" Display="Dynamic" Operator="Equal"
                                ErrorMessage="(Password doesn't match )" ForeColor="White" ControlToValidate="TextBox3" ControlToCompare="TextBox2" ValidationGroup="p"></asp:CompareValidator>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="text-align: center" class="style46" >
                            <asp:Button ID="Button1" runat="server" Height="23px" 
                                Text="Submit" Width="92px"   onclick="Button1_Click" OnClientClick="return Validate()" />
                                <script type="text/javascript">
                                    function Validate() 
                                        {
                                        var isValid = false;
                                        isValid = Page_ClientValidate('g');
                                        if (isValid) {
                                            isValid = Page_ClientValidate('p');
                                        }
                                        return isValid;
                                     }
                            </script>
                        </td>
                    </tr>
                </table>
            &nbsp;</td>
        </tr>
    </table>
</asp:Content>

