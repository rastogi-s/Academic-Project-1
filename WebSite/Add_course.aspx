<%@ Page Title="" Language="C#" MasterPageFile="~/childmasterStaff.master" AutoEventWireup="true" CodeFile="Add_course.aspx.cs" Inherits="Default2" %>

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
    .style52
    {
        height: 45px;
    }
    .style205
    {
        background-color: #b50d0d;
        width: 137px;
        text-align: left;
        color: #FFFFFF;
        font-weight: 700;
        height: 24px;
    }
    .style206
    {
        width: 222px;
        height: 24px;
        background-color: #b50d0d;
    }
    .style207
    {
        background-color: #b50d0d;
        width: 137px;
        text-align: left;
        color: #FFFFFF;
        font-weight: 700;
        height: 21px;
    }
    .style208
    {
        width: 222px;
        height: 21px;
        background-color: #b50d0d;
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
                        <td class="style207">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong><span class="style31">
                            &nbsp;Course Id:</span></strong></td>
                        <td class="style208">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:TextBox ID="TextBox1" runat="server" Height="21px" Width="97px" ontextchanged="TextBox1_TextChanged" AutoPostBack="true" 
                               ></asp:TextBox>
                        &nbsp;&nbsp;&nbsp;
                            </td>
                    </tr>
                    <tr>
                        <td class="style205">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Course Name:</td>
                        <td class="style206">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:TextBox ID="TextBox2" runat="server" Height="21px" Width="185px" 
                                ></asp:TextBox>
                            &nbsp;&nbsp;&nbsp;
                            </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="text-align: center" class="style52" >
                            <asp:Button ID="Button1" runat="server" Height="24px" 
                                Text="ADD" Width="92px" onclick="Button1_Click"  
                                />
                        </td>
                    </tr>
                </table>
            &nbsp;</td>
        </tr>
    </table>
</asp:Content>

