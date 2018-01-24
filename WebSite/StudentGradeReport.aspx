<%@ Page Title="" Language="C#" MasterPageFile="~/childmasterStudent.master" AutoEventWireup="true" CodeFile="StudentGradeReport.aspx.cs" Inherits="Default4" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head2" Runat="Server">
    <style type="text/css">
        .style31
        {
            height: 55px;
            text-align: center;
        }
        .style42
        {
            height: 19px;
            text-align: center;
        }
        
        .style46
        {
            height: 34px;
            text-align: left;
        }
        .style51
        {
            font-size: large;
            color: #FFFFFF;
        }
        .style52
        {
            height: 34px;
        }
        .style53
        {
            font-size: large;
            color: #FFFFFF;
        }
        .style54
        {
            height: 24px;
            text-align: left;
        }
        .style55
        {
            height: 47px;
            text-align: center;
            font-weight: 700;
            font-size: x-large;
            text-decoration: underline;
        }
        .style56
        {
            height: 291px;
            text-align: center;
        }
        .style204
        {
            width: 307px;
        }
        .style205
        {
            width: 124px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <table style="width:100%; height: 536px;">
        <tr>
            <td class="style31">

            <table style="width:100%; height: 123px;">
            <tr>
            <td class="style205">
            </td>
            <td class="style204">
            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>
                Academic Year :&nbsp;
                <asp:DropDownList ID="DropDownList1" runat="server" style="text-align: left; " 
                    Width="181px" Height="27px" DataSourceID="SqlDataSource1" 
                    DataTextField="acad_year" DataValueField="acad_year" 
                    AppendDataBoundItems="true" 
                    onselectedindexchanged="DropDownList1_SelectedIndexChanged" AutoPostBack="true">
                    <asp:ListItem>Select Academic Year</asp:ListItem>
                </asp:DropDownList>

               

                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:school_management_systemConnectionString %>" 
                    SelectCommand="select acad_year  from academic_year"></asp:SqlDataSource>
                    </ContentTemplate></asp:UpdatePanel>
                    </td>
                    <td class="style204">
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                        Term :
                <asp:DropDownList ID="DropDownList2" runat="server" Height="27px" 
                    style="text-align: center" Width="120px" DataSourceID="SqlDataSource2" 
                    DataTextField="term_desc" DataValueField="term_desc" 
                    AppendDataBoundItems="true" ValidationGroup="g" 
                            onselectedindexchanged="DropDownList1_SelectedIndexChanged" AutoPostBack="true" >
                    <asp:ListItem>Select Term</asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:school_management_systemConnectionString %>" 
                    SelectCommand="SELECT term_desc FROM term"></asp:SqlDataSource>
                    </ContentTemplate></asp:UpdatePanel>
                    </td>
                <td>
                <asp:Button ID="Button1" runat="server" Text="Generate" Height="29px" 
                    style="text-align: center" onclick="Button1_Click" ValidationGroup="g" />
            </td>
        </tr>
        <tr>
        <td class="style205">
            &nbsp;</td>
        <td class="style204">
        
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ErrorMessage="Select Academic Year"  ValidationGroup="g" 
                ControlToValidate="DropDownList1" Display="Dynamic" InitialValue="Select Academic Year" ></asp:RequiredFieldValidator>
        
        
        </td>
        <td>
        
            
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ErrorMessage="Select Term"  ValidationGroup="g" 
                ControlToValidate="DropDownList2" Display="Dynamic" InitialValue="Select Term" ></asp:RequiredFieldValidator>
        
        </td>
        
        </tr>
        </table>
        </td>
        </tr>
        <tr>
            <td class="style42">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                &nbsp;</td>
        </tr>
        <tr>
            <td style="background-color:#b50d0d"  class="style52">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<span 
                    class="style53"><strong>Name:</strong></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="TextBox2" runat="server" Enabled="false" ></asp:TextBox>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
                <asp:TextBox ID="TextBox3" runat="server" Enabled="false" ></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="TextBox4" runat="server" Enabled="false"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style46" style="background-color:#b50d0d">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                &nbsp;<strong><span class="style51">Class:</span></strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="TextBox5" runat="server" Enabled="false"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <strong>&nbsp;&nbsp;&nbsp; &nbsp;<span class="style51">Sec:</span></strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="TextBox6" runat="server" Enabled="false"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style46" style="background-color:#b50d0d">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                <strong><span class="style51">Roll No:</span></strong>&nbsp;&nbsp;
                <asp:TextBox ID="TextBox7" runat="server" Enabled="false" ></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <strong style="color: #FFFFFF">&nbsp;&nbsp; &nbsp;Regn No:</strong>&nbsp;&nbsp;
                <asp:TextBox ID="TextBox8" runat="server" Enabled="false" ></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style54">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; </td>
        </tr>
        <tr>
            <td class="style55">
                Grade Report</td>
        </tr>
        <tr>
            <td class="style56" valign="top">
                <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:UpdatePanel ID="UpdatePanel3" runat="server">
               <ContentTemplate>
                <asp:MultiView ID="MultiView1" runat="server">
                    <asp:View ID="View1" runat="server" >
                        
                        <table style="width: 100%;">
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
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <td valign="middle" align="center">
                                    &nbsp;<asp:GridView ID="GridView1" runat="server" Width="644px" 
                                        BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" 
                                        CellPadding="3" CellSpacing="2" >
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
                                </td>
                                <td>
                                    &nbsp;
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
                    </asp:View>
                    
                </asp:MultiView>
                </ContentTemplate><Triggers>
                <asp:AsyncPostBackTrigger  ControlID="DropDownList1" EventName="SelectedIndexChanged"/>
                <asp:AsyncPostBackTrigger  ControlID="DropDownList2" EventName="SelectedIndexChanged"/>
                </Triggers></asp:UpdatePanel>
            </td>
        </tr>
    </table>
</asp:Content>

