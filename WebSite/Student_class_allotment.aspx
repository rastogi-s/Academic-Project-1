<%@ Page Title="" Language="C#" MasterPageFile="~/childmasterStaff.master" AutoEventWireup="true" CodeFile="Student_class_allotment.aspx.cs" Inherits="_Default" %>

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
        width: 155px;
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
    .style201
    {
        background-color: #b50d0d;
        width: 155px;
        text-align: left;
        color: #FFFFFF;
        font-weight: 700;
        height: 80px;
    }
    .style202
    {
        background-color: #b50d0d;
        width: 203px;
        text-align: left;
        color: #FFFFFF;
        font-weight: 700;
        height: 80px;
    }
    .style203
    {
        background-color: #b50d0d;
        width: 136px;
        text-align: left;
        color: #FFFFFF;
        font-weight: 700;
        height: 80px;
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
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong><span class="style31">
                            &nbsp;Regn. No:</span></strong></td>
                        <td class="style49" colspan="3">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:TextBox ID="TextBox1" runat="server" Height="21px" Width="166px" 
                                ontextchanged="TextBox1_TextChanged" AutoPostBack="true"></asp:TextBox>
                        &nbsp;&nbsp;&nbsp;
                            </td>
                    </tr>
                    <tr>
                        <td class="style201">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Student&#39;s Name:</td>
                        <td class="style51" colspan="3">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:TextBox ID="TextBox2" runat="server" Height="21px" Width="166px" 
                                ></asp:TextBox>
                            &nbsp;&nbsp;&nbsp;
                            </td>
                    </tr>
                    <tr>
                        <td class="style201">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Class:</td>
                        <td class="style202">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:TextBox ID="TextBox4" runat="server" Height="21px" Width="88px"></asp:TextBox>
                        </td>
                        <td class="style203">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Section:&nbsp;</td>
                        <td class="style50">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:TextBox ID="TextBox5" runat="server" Height="21px" Width="58px" 
                                ></asp:TextBox>
                        </td>
                        </tr>
                    <tr>
                        <td class="style201">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Roll No:</td>
                        <td class="style51" colspan="3">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:TextBox ID="TextBox3" runat="server" Height="21px" Width="124px" 
                                ></asp:TextBox>
                            &nbsp;&nbsp;&nbsp;
                            </td>
                    </tr>
                    <tr>
                        <td colspan="4" style="text-align: center" class="style52" >
                            <asp:Button ID="Button1" runat="server" Height="23px" 
                                Text="Submit" Width="92px" ValidationGroup="Not_empty" 
                                onclick="Button1_Click" />
                        </td>
                    </tr>
                </table>
            &nbsp;</td>
        </tr>
    </table>
</asp:Content>