<%@ Page Title="" Language="C#" MasterPageFile="~/childmasterStaff.master" AutoEventWireup="true" CodeFile="Add_class_course.aspx.cs" Inherits="_Default" %>

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
        width: 231px;
        text-align: left;
        color: #FFFFFF;
        font-weight: 700;
        height: 24px;
        font-size: medium;
    }
    .style206
    {
        width: 222px;
        height: 24px;
        background-color: #b50d0d;
        color: #FFFFFF;
        font-weight: 700;
        font-size: medium;
    }
    .style207
    {
        background-color: #b50d0d;
        width: 231px;
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
    .style209
    {
        width: 265px;
        height: 24px;
        background-color: #b50d0d;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">
 
                 &nbsp;&nbsp;&nbsp;&nbsp;
    <table style="width: 100%; height: 497px; text-align: left; margin-left:30px">
        <tr>
            <td style="text-align: left; vertical-align:top; margin-top:30px; margin-left:30px; padding-left:180px ">
                &nbsp;
                <table style="width: 678px; height: 286px"
                    align="left">
                    <tr>
                        <td class="style207">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong><span class="style31">
                            &nbsp;Course Name:</span></strong></td>
                        <td class="style208" colspan="3">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:DropDownList ID="DropDownList1" runat="server" Height="22px" Width="186px">
                            </asp:DropDownList>
                        &nbsp;&nbsp;&nbsp;
                            </td>
                    </tr>
                    <tr>
                        <td class="style205">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Class:</td>
                        <td class="style209">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:TextBox ID="TextBox2" runat="server" Height="21px" Width="72px"  
                                ></asp:TextBox>
                            &nbsp;&nbsp;&nbsp;
                            </td>
                        <td class="style206">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Section:&nbsp;</td>
                        <td class="style206">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:TextBox ID="TextBox3" runat="server" Width="55px"></asp:TextBox>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="4" style="text-align: center" class="style52" >
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

