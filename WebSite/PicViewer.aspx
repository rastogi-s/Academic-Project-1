<%@ Page Language="C#" StyleSheetTheme="BlackTheme" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="PicViewer.aspx.cs" Inherits="Nileblitz.SIP.SIP_PicViewer" %>
<asp:Content ID="PicViewerContent" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server" >
    <table  width="760px" cellpadding="1" cellspacing="0" align="center">
        <tr><td colspan="3"><asp:PlaceHolder ID="galleryPlaceholder" runat="server"></asp:PlaceHolder></td></tr>
        <tr><td bgcolor="#494949" width="700px" style="text-align: left">
            <asp:Label ID="lblGalleryName" runat="server" CssClass="SubHeadingWhite">▼ How to use</asp:Label>
        </td>
        <td  bgcolor="#494949"></td>
        <td  bgcolor="#494949"><asp:HyperLink ID="lnkPhotoPrev" runat="server" NavigateUrl="#" CssClass="lnkWhite">◄</asp:HyperLink></td>
        <td  bgcolor="#494949"><asp:Label ID="lblPhotoName" runat="server" CssClass="SubTitleWhite"></asp:Label></td>
        <td  bgcolor="#494949"><asp:HyperLink ID="lnkPhotoNext" runat="server" NavigateUrl="#" CssClass="lnkWhite">►</asp:HyperLink></td>
        </tr>
        <tr><td align="center" colspan="3"><asp:Image ID="galleryImage" runat="server"  
                BorderStyle="Solid" BorderWidth="5px" BorderColor="Black" Height="526" 
                Width="820" style="text-align: right; margin-right: 1px" /></td></tr>
    </table>
</asp:Content>

