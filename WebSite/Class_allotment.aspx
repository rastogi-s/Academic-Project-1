<%@ Page Title="" Language="C#" MasterPageFile="~/childmasterStaff.master" AutoEventWireup="true" CodeFile="Class_allotment.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head3" Runat="Server">
    <style type="text/css">
        .style30
        {
            background-color:#b50d0d;            
            height: 61px;
        }
        .style31
        {
            background-color: #b50d0d;
            height: 61px;
            font-weight: 700;
            color: #FFFFFF;
            width: 140px;
        }
        .style33
        {
            background-color:#b50d0d;
            font-size: large;
            color: #FFFFFF;
        }
        .style34
        {
            background-color:#b50d0d;
            width: 174px;
        }
        .style35
        {
            background-color:#b50d0d;
            width: 103px;
        }
        .style36
        {
            height: 43px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">
    <table style="width: 60%; height: 231px; margin-left:60px">
        <tr>
            <td class="style31">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong><span class="style33">Faculty-Id</span></strong> :</td>
            <td class="style30" colspan="3">
&nbsp;&nbsp;
&nbsp;<asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" 
                    DataTextField="faculty_id" DataValueField="faculty_id" Height="33px" 
                    Width="108px" onselectedindexchanged="DropDownList1_SelectedIndexChanged" AutoPostBack=true OnDataBound="ddl_databound">
                    </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:school_management_systemConnectionString %>" 
                    SelectCommand="SELECT [faculty_id] FROM [faculty_table]">
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="style31">
                &nbsp;<strong><span class="style33">Faculty Name</span></strong>&nbsp;:</td>
            <td colspan="3" style="background-color:#b50d0d;">
                &nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="TextBox1" runat="server" Height="27px" Width="257px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style31">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <strong><span class="style33">Class</span></strong> :
                &nbsp;</td>
            <td class="style34">
                &nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="TextBox2" runat="server" Width="71px" Height="24px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp; </td>
            <td class="style35">
                <strong><span class="style33">&nbsp;&nbsp;&nbsp;&nbsp;Section :</span></strong></td>
            <td style="background-color:#b50d0d;">
                &nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="TextBox4" runat="server" Width="57px" Height="24px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td  colspan="4" class="style36" 
                style="text-align: center; background-color: #B50D0D">
                <asp:Button ID="Button1" runat="server" Text="Update" Width="106px" 
                    onclick="Button1_Click" />
            </td>
        </tr>
    </table>
</asp:Content>

