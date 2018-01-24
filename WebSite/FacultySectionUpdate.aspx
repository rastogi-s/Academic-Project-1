<%@ Page Title="" Language="C#" MasterPageFile="~/childmasterFaculty.master" AutoEventWireup="true" CodeFile="FacultySectionUpdate.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head3" Runat="Server">
    <style type="text/css">
        .style29
        {
            background-color: #b50d0d;
            height: 43px;
            color: #FFFFFF;
        }
        .style30
        {
            height: 34px;
        }
        .style34
        {
            height: 611px;
        }
    </style>
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">
   
    <table style="width: 100%; height: 111px;">
        <tr>
            <td class="style29">
                &nbsp; <strong>Year</strong>:&nbsp;
                <asp:Label ID="Label8" runat="server" Text="Label"></asp:Label>
            </td>
            <td class="style29">
                &nbsp; <strong>Month</strong>:&nbsp;
                <asp:Label ID="Label9" runat="server" Text="Label"></asp:Label>
            </td>
            <td class="style29">
                &nbsp; <strong>Course id</strong>:&nbsp;
                <asp:Label ID="Label10" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style29">
                &nbsp; <strong>Class</strong>:&nbsp;
                <asp:Label ID="Label11" runat="server" Text="Label"></asp:Label>
            </td>
            <td class="style29">
                &nbsp; <strong>Section</strong>:&nbsp;
                <asp:Label ID="Label12" runat="server" Text="Label"></asp:Label>
            </td>
            <td class="style29">
                &nbsp; <strong>Course Name</strong>:&nbsp;
                <asp:Label ID="Label13" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
    </table>
    <table style="width: 100%; height: 651px; border-collapse:collapse">
        <tr>
            <td class="style30" style="padding-left:30px">
                <asp:Calendar ID="Calendar1" runat="server" Height="161px" Width="238px">
                </asp:Calendar>
&nbsp;</td>
            <td class="style30">
                &nbsp;
            </td>
            <td class="style30">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td colspan="3" align=center valign=top style="text-align: center" 
                class="style34">
                
                &nbsp;
                <asp:GridView ID="GridView1" runat="server" Height="208px" Width="646px">
                </asp:GridView>
                <br />
                <asp:Button ID="Button1" runat="server" Text="Submit" />
            </td>
        </tr>
        </table>
</asp:Content>

