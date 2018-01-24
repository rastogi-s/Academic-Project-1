<%@ Page Title="" Language="C#" MasterPageFile="~/childmasterStudent.master" AutoEventWireup="true" CodeFile="StudentAttendanceReport.aspx.cs" Inherits="Default4" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head2" Runat="Server">
    <style type="text/css">
                
        .style46
        {
            height: 34px;
            text-align: left;
            width: 551px;
        }
        .style51
        {
            font-size: large;
            color: #FFFFFF;
        }
        .style52
        {
            height: 34px;
            width: 551px;
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
            width: 551px;
        }
        .style55
        {
            height: 47px;
            text-align: center;
            font-weight: 700;
            font-size: x-large;
            text-decoration: underline;
            width: 551px;
        }
        .style201
        {
            width: 551px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
   <table style="width:100%; height: 536px;">
   <tr>
   <td style="padding-right:20px; padding-left:100px">
       <table style="width:90%; height: 536px;">
        
        <tr>
            <td style="background-color:#b50d0d"  class="style52" colspan="2">
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
            <td class="style46" style="background-color:#b50d0d" colspan="2">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                &nbsp;<strong><span class="style51">Class:</span></strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="TextBox5" runat="server" Enabled="false"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <strong>&nbsp;&nbsp;&nbsp; &nbsp;<span class="style51">Sec:</span></strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="TextBox6" runat="server" Enabled="false"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style46" style="background-color:#b50d0d" colspan="2">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                <strong><span class="style51">Roll No:</span></strong>&nbsp;&nbsp;
                <asp:TextBox ID="TextBox7" runat="server" Enabled="false" ></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <strong style="color: #FFFFFF">&nbsp;&nbsp; &nbsp;Regn No:</strong>&nbsp;&nbsp;
                <asp:TextBox ID="TextBox8" runat="server" Enabled="false" ></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style54" colspan="2">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; </td>
        </tr>
        <tr>
            <td class="style55" colspan="2">
                Attendance Report</td>
        </tr>
        <tr>
            <td>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                <asp:Panel ID="Panel1" runat="server">
                    <table style="width: 100%;">
                        <tr>
                           
                                <td class="style201" valign="top" >
            
&nbsp;<asp:Calendar ID="Calendar1" runat="server" BackColor="#FFFFCC" 
                    BorderColor="#FFCC66" BorderWidth="1px" DayNameFormat="Shortest" 
                    Font-Names="Verdana" Font-Size="8pt" ForeColor="#663399" Height="200px" 
                    ShowGridLines="True" Width="220px">
                    <DayHeaderStyle BackColor="#FFCC66" Font-Bold="True" Height="1px" />
                    <NextPrevStyle Font-Size="9pt" ForeColor="#FFFFCC" />
                    <OtherMonthDayStyle ForeColor="#CC9966" />
                    <SelectedDayStyle BackColor="#CCCCFF" Font-Bold="True" />
                    <SelectorStyle BackColor="#FFCC66" />
                    <TitleStyle BackColor="#990000" Font-Bold="True" Font-Size="9pt" 
                        ForeColor="#FFFFCC" />
                    <TodayDayStyle BackColor="#FFCC66" ForeColor="White" />
                </asp:Calendar>
                <br />
                <br />
                <br />
                
               
                
            </td>
            
            <td class="style201" valign="top"  style=" padding-top:23px">
            
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" 
                    CellPadding="3" CellSpacing="2" DataSourceID="SqlDataSource1" 
                    style="text-align: center; margin-left: 37px" Height="194px" Width="271px" 
                    >
                    <Columns>
                        <asp:BoundField DataField="course_id" HeaderText="Course Id" 
                            SortExpression="course_id" />
                        <asp:BoundField DataField="course_name" HeaderText="Course Name" 
                            SortExpression="course_name" />
                        <asp:BoundField DataField="status_" HeaderText="Status" 
                            SortExpression="status_" />
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
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:school_management_systemConnectionString %>" 
                    SelectCommand="student_attendance_view" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:SessionParameter Name="reg_no" SessionField="user_id" Type="String" />
                        <asp:ControlParameter ControlID="Calendar1" DbType="Date" Name="date" 
                            PropertyName="SelectedDate" />
                    </SelectParameters>
                </asp:SqlDataSource>
                
            </td>
                            
                        </tr>
                    </table>
                </asp:Panel>
                 </ContentTemplate></asp:UpdatePanel>
           
    </td>
    </tr>
    </table>

</asp:Content>
