<%@ Page Title="" Language="C#" MasterPageFile="~/childmasterStudent.master" AutoEventWireup="true" CodeFile="student_home.aspx.cs" Inherits="Default2" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head2" Runat="Server">
    <style type="text/css">
        .style37
        {
            width: 234px;
        }
        .style38
        {
            width: 94px;
        }
        .style39
        {
            width: 124px;
        }
       
        .style53
        {
            width: 124px;
            height: 53px;
        }
        .style62
        {
            width: 94px;
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
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <table style="width: 100%; height: 418px;">
        <tr>
            <td class="style39" rowspan="3">
                
                &nbsp;</td>
            <td class="style37" rowspan="4">
                <asp:Image  ID="image1"  runat="server" Height="210px" Width="190px"   />
                &nbsp;</td>
            <td class="style62" bgcolor="#B50D0D">
                <span class="style68">&nbsp;&nbsp;&nbsp;&nbsp; </span><span class="style66">Name</span><span 
                    class="style68"> :</span></td>
            <td class="style64" bgcolor="#B50D0D">
                &nbsp;&nbsp;
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
                &nbsp;&nbsp;
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
                &nbsp;&nbsp;
                <asp:Label ID="Label7" runat="server" CssClass="style68"></asp:Label>
            </td>
            <td class="style63">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style53">
                </td>
            <td class="style62" bgcolor="#B50D0D">
                <span class="style68">&nbsp;&nbsp;&nbsp; </span><span class="style66">Reg. No</span><span 
                    class="style68">. :</span></td>
            <td class="style64" bgcolor="#B50D0D">
                &nbsp;&nbsp;
                <asp:Label ID="Label8" runat="server" CssClass="style68"></asp:Label>
            </td>
            <td class="style63">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style39">
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

