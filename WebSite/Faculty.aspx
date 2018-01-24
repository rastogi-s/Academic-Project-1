<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Faculty.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style27
        {
            width: 113px;
        }
        .style28
        {
            width: 1073px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width: 100%; height: 554px;">
        <tr>
            <td class="style27">
                &nbsp;
            </td>
            <td class="style28">
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td class="style27">
                &nbsp;
            </td>
            <td  valign="middle" align="center" style="text-align: center; " 
                class="style28"  >
                &nbsp;
                <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                    AllowSorting="True" AutoGenerateColumns="False" CellPadding="3" 
                    DataSourceID="SqlDataSource2"   HeaderStyle-Height="50px"
                    Height="498px" Width="100%" BackColor="#DEBA84" BorderColor="#DEBA84" 
                    BorderStyle="None" BorderWidth="1px" CellSpacing="2">
                    <Columns>
                        <asp:ImageField DataImageUrlField="image" ControlStyle-Height="200px" ControlStyle-Width="180px"  AlternateText="Photo not Available" >
<ControlStyle Height="200px" Width="180px"></ControlStyle>
                        </asp:ImageField>
                        <asp:BoundField DataField="Name" HeaderText="Name" ReadOnly="True" 
                            SortExpression="Name" />
                        <asp:BoundField DataField="Date" HeaderText="Date Of Joining" ReadOnly="True" 
                            SortExpression="Date" />
                        <asp:BoundField DataField="Contact" HeaderText="Contact No." 
                            SortExpression="Contact" />
                        <asp:BoundField DataField="Email" HeaderText="Email ID" SortExpression="Email" />
                        <asp:BoundField DataField="Qualification" HeaderText="Qualification" 
                            SortExpression="Qualification" />
                    </Columns>
                    <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                    <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                    <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                    <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                    <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#FFF1D4" />
                    <SortedAscendingHeaderStyle BackColor="#B95C30" />
                    <SortedDescendingCellStyle BackColor="#F1E5CE" />
                    <SortedDescendingHeaderStyle BackColor="#93451F" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:school_management_systemConnectionString %>" 
                    SelectCommand="SELECT ISNULL(first_name, '') + '  ' + ISNULL(middle_name, '') + '  ' + ISNULL(last_name, '') AS Name, CONVERT (varchar(30), year_of_joining, 105) AS Date, mobile_no AS Contact, email_id AS Email, '~/Uploads/Faculty/' + image_url AS image, qualification AS Qualification FROM faculty_table">
                </asp:SqlDataSource>
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td class="style27">
                &nbsp;
            </td>
            <td class="style28">
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
    </table>
</asp:Content>

