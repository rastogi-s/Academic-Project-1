﻿<%@ Page Title="" Language="C#" MasterPageFile="~/childmasterStaff.master" AutoEventWireup="true" CodeFile="ResetPassStaff.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head3" Runat="Server">
<style type="text/css">
     .style45
        {
            height:55px;
        }
        .style29
        {
            background-color:#b50d0d;
            width: 209px;
        }
        .style31
        {
            font-size: medium;
            }
    .style48
    {
        background-color: #b50d0d;
        width: 137px;
        text-align: left;
        color: #FFFFFF;
        font-weight: 700;
        height: 79px;
    }
    .style49
    {
        width: 222px;
        height: 79px;
        background-color: #b50d0d;
    }
    .style50
    {
        background-color: #b50d0d;
        width: 137px;
        text-align: left;
        color: #FFFFFF;
        font-weight: 700;
        height: 80px;
    }
    .style51
    {
        width: 222px;
        height: 80px;
        background-color: #b50d0d;
    }
    .style52
    {
        height: 45px;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">
 
                 &nbsp;&nbsp;&nbsp;&nbsp;
    <table style="width: 100%; height: 497px; text-align: left; margin-left=30px">
        <tr>
            <td style="text-align: left; vertical-align:top; margin-top:30px; margin-left=30px; padding-left:180px ">
                &nbsp;
                <table style="width: 678px; height: 286px;  " 
                    align="left">
                    <tr>
                        <td class="style48">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong><span class="style31">&nbsp;Old 
                            Password:</span></strong></td>
                        <td class="style49">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:TextBox ID="TextBox1" runat="server" Height="21px" Width="166px" TextMode="Password"></asp:TextBox>
                        &nbsp;&nbsp;&nbsp;
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ForeColor="#ffffff"
                                ErrorMessage="(Field cannot be empty)"  ControlToValidate="TextBox1" ValidationGroup="g" ></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style50">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; New Password:</td>
                        <td class="style51">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:TextBox ID="TextBox2" runat="server" Height="21px" Width="166px" TextMode="Password"></asp:TextBox>
                            &nbsp;&nbsp;&nbsp;
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ForeColor="#ffffff"
                                ErrorMessage="(Field cannot be empty)"  ControlToValidate="TextBox2" ValidationGroup="g" ></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style50">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Confirm Password:</td>
                        <td class="style51">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:TextBox ID="TextBox3" runat="server" Height="21px" Width="166px" TextMode="Password"></asp:TextBox>
                            &nbsp;&nbsp;&nbsp;
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ForeColor="#ffffff"
                                ErrorMessage="(Field cannot be empty)"  ControlToValidate="TextBox3" ValidationGroup="g" ></asp:RequiredFieldValidator>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:CompareValidator ID="CompareValidator1" runat="server" Display="Dynamic" Operator="Equal" ValidationGroup="p"
                                ErrorMessage="(Password doesn't match)" ForeColor="White" ControlToValidate="TextBox3" ControlToCompare="TextBox2"></asp:CompareValidator>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="text-align: center" class="style52" >
                            <asp:Button ID="Button1" runat="server" Height="23px" 
                                Text="Submit" Width="92px"  OnClientClick="return Validate()"
                                onclick="Button1_Click" />
                                <script type="text/javascript">
                                    function Validate() {
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

