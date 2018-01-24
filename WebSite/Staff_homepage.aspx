<%@ Page Title="" Language="C#" MasterPageFile="~/childmasterStaff.master" AutoEventWireup="true" CodeFile="Staff_homepage.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head3" Runat="Server">
    <style type="text/css">
        .style37
        {
            width: 234px;
        }
        .style45
        {
            height: 55px;
        }
        .style62
        {
        width: 192px;
        height: 53px;
    }
        .style63
        {
            height: 53px;
        }
    .style64
    {
        padding-left:10px;
        width: 314px;
        height: 53px;
    }
    .style66
    {
        text-decoration: underline;
        color: #FFFFFF;
    }
    .style68
    {
        color: #FFFFFF;
    }
    .style69
    {
        width: 65px;
        height: 61px;
    }
    .style70
    {
        width: 65px;
    }
     .style71
     {
         height: 330px;
     }
     .style72
     {
         width: 192px;
         height: 61px;
     }
     .style73
     {
         padding-left:10px;
         width: 314px;
         height: 61px;
     }
     .style74
     {
         height: 61px;
     }
     .style75
     {
         height: 51px;
     }
     .style76
     {
         height: 34px;
         text-align: center;
     }
    .style77
    {
        text-decoration: underline;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">
    <table style="width: 100%; height: 557px;">
        <tr>
            <td class="style70" rowspan="3">
                
                &nbsp;</td>
            <td class="style37" rowspan="4">
                <asp:Image ID="image1" runat="server" Height="210px" Width="190px"   />
                &nbsp;</td>
            <td class="style62" bgcolor="#B50D0D">
                <span class="style68">&nbsp;&nbsp;&nbsp;&nbsp; </span><span class="style66">Name</span><span 
                    class="style68"> :</span></td>
            <td class="style64" bgcolor="#B50D0D">
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
                <asp:Label ID="Label6" runat="server" CssClass="style68"></asp:Label>
            </td>
            <td class="style63">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style62" bgcolor="#B50D0D">
                <span class="style68">&nbsp;&nbsp;&nbsp; </span><span class="style66">Gender</span><span 
                    class="style68"> :&nbsp;</span></td>
            <td class="style64" bgcolor="#B50D0D">
                <asp:Label ID="Label7" runat="server" CssClass="style68"></asp:Label>
            </td>
            <td class="style63">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style69">
                </td>
            <td class="style72" bgcolor="#B50D0D">
                <span class="style68">&nbsp;&nbsp;&nbsp; <span class="style77">Department Name</span> 
                : </span></td>
            <td class="style73" bgcolor="#B50D0D">
                <asp:Label ID="Label8" runat="server" CssClass="style68"></asp:Label>
            </td>
            <td class="style74">
                </td>
        </tr>
        <tr>
            <td class="style75" colspan="5">
                </td>
        </tr>
        <tr>
            <td class="style76" colspan="5">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </td>
        </tr>
        <tr>
            <td class="style71" colspan="5" valign=top>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>


