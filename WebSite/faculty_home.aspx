<%@ Page Title="" Language="C#" MasterPageFile="~/childmasterFaculty.master" AutoEventWireup="true" CodeFile="faculty_home.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head3" Runat="Server">
    <style type="text/css">
        .style37
        {
            width: 234px;
        }
        .style38
        {
            width: 108px;
        }
        .style45
        {
            height: 55px;
        }
        .style62
        {
        width: 108px;
        height: 53px;
    }
        .style63
        {
            height: 53px;
        }
    .style64
    {
        width: 314px;
        height: 53px;
    }
    .style66
    {
        text-decoration: underline;
        color: #FFFFFF;
    }
    .style67
    {
        width: 314px;
    }
    .style68
    {
        color: #FFFFFF;
    }
    .style69
    {
        width: 65px;
        height: 67px;
    }
    .style70
    {
        width: 65px;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">
    <table style="width: 100%; height: 557px;">
        <tr>
            <td class="style70" rowspan="3">
                
                &nbsp;</td>
            <td class="style37" rowspan="4">
                <asp:Image ID="Image1"  ImageUrl="Slides/photo.jpg" runat="server" Height="210px" Width="190px"   />
                &nbsp;</td>
            <td class="style62" bgcolor="#B50D0D">
                <span class="style68">&nbsp;&nbsp;&nbsp;&nbsp; </span><span class="style66">Name</span><span 
                    class="style68"> :</span></td>
            <td class="style64" bgcolor="#B50D0D">
                &nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label2" runat="server" CssClass="style68"></asp:Label>
            </td>
            <td class="style63">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style62" bgcolor="#B50D0D">
                <span class="style68">&nbsp;&nbsp;&nbsp; </span><span class="style66">DOB</span><span 
                    class="style68"> :</span></td>
            <td class="style64" bgcolor="#B50D0D">
                &nbsp;&nbsp;&nbsp;<asp:Label ID="Label6" runat="server" CssClass="style68"></asp:Label>
            </td>
            <td class="style63">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style62" bgcolor="#B50D0D">
                <span class="style68">&nbsp;&nbsp;&nbsp; </span><span class="style66">Gender</span><span 
                    class="style68"> :&nbsp;</span></td>
            <td class="style64" bgcolor="#B50D0D">
                &nbsp;&nbsp;&nbsp;<asp:Label ID="Label7" runat="server" CssClass="style68"></asp:Label>
            </td>
            <td class="style63">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style69">
                </td>
            <td class="style62" bgcolor="#B50D0D">
                <span class="style68">&nbsp;&nbsp;&nbsp; </span><span class="style66">Faculty ID</span><span 
                    class="style68">. :</span></td>
            <td class="style64" bgcolor="#B50D0D">
                &nbsp;&nbsp;&nbsp;<asp:Label ID="Label8" runat="server" CssClass="style68"></asp:Label>
            </td>
            <td class="style63">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style70">
                &nbsp;</td>
            <td class="style37">
                &nbsp;</td>
            <td class="style38">
                &nbsp;</td>
            <td class="style67">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

