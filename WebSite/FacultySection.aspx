<%@ Page Title="" Language="C#" MasterPageFile="~/childmasterFaculty.master" AutoEventWireup="true" CodeFile="FacultySection.aspx.cs" Inherits="_Default" EnableEventValidation="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head3" Runat="Server">
    <style type="text/css">
        .style29
        {
            height: 161px;
        }
        .style31
        {
            width: 205px;
        }
        .style32
        {
            width: 269px;
        }
    .style33
    {
        height: 33px;
    }
        .style36
        {
            height: 161px;
            width: 205px;
        }
        .style37
        {
            
            text-align: center;
            color: #FFFFFF;
            width: 360px;
            padding-left:35px;
            padding-top:20px
        }
        .style38
        {    
            text-align: center;
             height:100%;
        }
       
        .style202
        {
            background-color: #b50d0d;
            color: #FFFFFF;
            height: 35px;
           
        }
        .style214
        {
            width: 183px;
            text-align: center;
        }
        .style219
        {
            width: 437px;
        }
        .style220
        {
            height: 44px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server" >
     <asp:UpdatePanel ID="UpdatePanel3" runat="server"  ChildrenAsTriggers="false" 
         UpdateMode="Conditional" >
     <ContentTemplate>
    <table style="width: 100%; height:100%"  >
        <tr valign="top">
            <td   class="style38" width= "100%"   valign="top" >
               
                <table style="width: 100%; ">
                    <tr valign="top">
                        <td class="style36" 
                            style="background-color:#b50d0d; color: #FFFFFF; text-align: center;">
                            <br />
                            <asp:RadioButton ID="RadioButton1" runat="server" AutoPostBack="true" 
                                Checked="true" GroupName="g" oncheckedchanged="RadioButton1_CheckedChanged" 
                                Text="Class Teacher" />
                            <br />
                            <br />
                            <br />
                            Course Name :&nbsp;
                            <asp:DropDownList ID="DropDownList3" runat="server" AppendDataBoundItems="true" 
                                Height="23px" Width="107px">
                                <asp:ListItem Value="">Course</asp:ListItem>
                            </asp:DropDownList>
                            <br />
                            <br />
                        </td>
                        <td class="style29" 
                            style="background-color:#b50d0d; color: #FFFFFF; text-align: center;">
                            <br />
                            <asp:RadioButton ID="RadioButton2" runat="server" AutoPostBack="true" 
                                GroupName="g" oncheckedchanged="RadioButton2_CheckedChanged" 
                                Text="Sections Under" />
                            &nbsp;&nbsp;
                            <br />
                            <br />
                            <br />
                            <asp:CascadingDropDown ID="CascadingDropDown1" runat="server" Category="class" 
                                LoadingText="[Loading]" PromptText="class" ServiceMethod="GetDropDownContents1" 
                                ServicePath="WebService.asmx" TargetControlID="DropDownList1">
                            </asp:CascadingDropDown>
                            &nbsp;&nbsp;Class :
                            <asp:DropDownList ID="DropDownList1" runat="server" Height="23px" Width="79px">
                            </asp:DropDownList>
                            <asp:CascadingDropDown ID="CascadingDropDown2" runat="server" Category="sec" 
                                LoadingText="[Loading]" ParentControlID="DropDownList1" PromptText="sec" 
                                ServiceMethod="GetDropDownContents2" ServicePath="WebService.asmx" 
                                TargetControlID="DropDownList2">
                            </asp:CascadingDropDown>
                            &nbsp;&nbsp;&nbsp;&nbsp;Sec :
                            <asp:DropDownList ID="DropDownList2" runat="server" Height="23px" Width="55px">
                            </asp:DropDownList>
                            <asp:CascadingDropDown ID="CascadingDropDown3" runat="server" Category="course" 
                                LoadingText="[Loading]" ParentControlID="DropDownList2" 
                                PromptText="Course Name" ServiceMethod="GetDropDownContents3" 
                                ServicePath="WebService.asmx" TargetControlID="DropDownList10">
                            </asp:CascadingDropDown>
                            &nbsp;&nbsp;&nbsp;Course Name :&nbsp;
                            <asp:DropDownList ID="DropDownList10" runat="server" Height="23px" 
                                Width="107px">
                            </asp:DropDownList>
                            &nbsp;&nbsp;
                            <br />
                            <br />
                        </td>
                    </tr>
                    <tr valign="top">
                        <td class="style31" style="background-color:#b50d0d; text-align: center;">
                            <asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
                                Text="Attendance" />
                        </td>
                        <td class="style32" style="background-color:#b50d0d; text-align: center;">
                            <asp:MultiView ID="MultiView2" runat="server" ActiveViewIndex="0">
                                <asp:View ID="View3" runat="server">
                                    <table style="width: 102%; height: 44px;">
                                        <tr>
                                            <td class="style220" style="text-align: left">
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="Button5" 
                                                    runat="server" onclick="Button5_Click" Text="Grades" />
                                                &nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="Button6" runat="server" Text="Rank List" />
                                                &nbsp;
                                            </td>
                                        </tr>
                                    </table>
                                </asp:View>
                                <asp:View ID="View4" runat="server">
                                    <table style="width: 102%; height: 32px;">
                                        <tr>
                                            <td class="style220">
                                                <asp:Button ID="Button7" runat="server" onclick="Button7_Click" Text="Grades" />
                                            </td>
                                        </tr>
                                    </table>
                                </asp:View>
                            </asp:MultiView>
                        </td>
                    </tr>
                </table>
                <asp:UpdatePanel ID="UpdatePanel4" runat="server" ChildrenAsTriggers="false" 
                    UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:MultiView ID="MultiView1" runat="server">
                            <asp:View ID="View1" runat="server">
                                <table style="width: 76%; height: 340px;">
                                    <tr>
                                        <td align="center" class="style37" rowspan="2" valign="top">
                                            <asp:UpdatePanel ID="UpdatePanel1" runat="server" ChildrenAsTriggers="true">
                                                <ContentTemplate>
                                                    <asp:Calendar ID="myCal" runat="server" BackColor="#FFFFCC" 
                                                        BorderColor="#FFCC66" BorderWidth="1px" DayNameFormat="Shortest" 
                                                        Font-Names="Verdana" Font-Size="8pt" ForeColor="#663399" Height="232px" 
                                                        NextMonthText="" OnPreRender="myCal_PreRender" PrevMonthText="&lt;" 
                                                        ShowGridLines="True" Width="320px">
                                                        <DayHeaderStyle BackColor="#FCC66" Font-Bold="True" Height="1px" />
                                                        <NextPrevStyle Font-Size="9pt" ForeColor="#FFFFCC" />
                                                        <OtherMonthDayStyle ForeColor="#CC9966" />
                                                        <SelectedDayStyle BackColor="#CCCCFF" Font-Bold="True" />
                                                        <SelectorStyle BackColor="#FFCC66" />
                                                        <TitleStyle BackColor="#990000" Font-Bold="True" Font-Size="9pt" 
                                                            ForeColor="#FFFFCC" />
                                                        <TodayDayStyle BackColor="#FFCC66" ForeColor="White" />
                                                    </asp:Calendar>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                            <br />
                                            <asp:Button ID="Button2" runat="server" Height="28px" 
                                                onclick="Button2_Click" Text="Generate Report" Width="131px" />
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <asp:Button ID="Button10" runat="server" Height="28px" 
                                                onclick="Button10_Click" Text="Update" Width="131px" />
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            </td>
                                        <td>
                                            <asp:UpdatePanel ID="UpdatePanel5" runat="server" ChildrenAsTriggers="true">
                                                <ContentTemplate>
                                                    <asp:MultiView ID="MultiView3" runat="server">
                                                        <asp:View ID="View5" runat="server">
                                                            <table style="width: 66%; height: 273px;">
                                                                <tr>
                                                                    <td class="style33">
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="text-align: center; padding-left:80px" valign="middle">
                                                                        <asp:GridView ID="GridView1" runat="server" BackColor="#DEBA84" 
                                                                            BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
                                                                            CellSpacing="2" Height="99px" Width="536px">
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
                                                                        
                                                                        <br />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="text-align: center">
                                                                        &nbsp;</td>
                                                                </tr>
                                                            </table>
                                                        </asp:View>
                                                        <asp:View ID="View6" runat="server">
                                                            <table style="width: 66%; height: 273px;">
                                                                <tr>
                                                                    <td class="style33">
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="text-align: center; padding-left:80px" valign="middle">
                                                                        <asp:GridView ID="GridView2" runat="server" BackColor="#DEBA84" 
                                                                            BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
                                                                            CellSpacing="2" Height="99px" Width="536px" AutoGenerateColumns="False" 
                                                                            DataSourceID="SqlDataSource1" style="text-align:center" >
                                                                            <Columns>
                                                                                <asp:BoundField DataField="Reg_No." HeaderText="Reg_No." 
                                                                                    SortExpression="Reg_No." />
                                                                                <asp:BoundField DataField="Roll_No" HeaderText="Roll_No" 
                                                                                    SortExpression="Roll_No" />
                                                                                <asp:BoundField DataField="Name" HeaderText="Name" ReadOnly="True" 
                                                                                    SortExpression="Name"  />
                                                                                    <asp:TemplateField HeaderText="Attendance Status">
                                                                                    <ItemTemplate>
                                                                                        <asp:CheckBox ID="CheckBox1" runat="server" Checked="true" />
                                                                                    </ItemTemplate>
                                                                                    </asp:TemplateField>
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
                                                                            SelectCommand="list_students" SelectCommandType="StoredProcedure">
                                                                            <SelectParameters>
                                                                                <asp:ControlParameter ControlID="DropDownList1" Name="class" 
                                                                                    PropertyName="SelectedValue" Type="Decimal" />
                                                                                <asp:ControlParameter ControlID="DropDownList2" Name="section" 
                                                                                    PropertyName="SelectedValue" Type="String" />
                                                                                <asp:ControlParameter ControlID="HiddenField1" Name="acad_year" 
                                                                                    PropertyName="Value" Type="Decimal" />
                                                                            </SelectParameters>
                                                                        </asp:SqlDataSource>
                                                                        <asp:HiddenField ID="HiddenField1" runat="server" />
                                                                       
                                                                        <br />
                                                                        <asp:Button ID="Button3" runat="server" Text="Submit" 
                                                                            onclick="Button3_Click1" />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="text-align: center">
                                                                        &nbsp;</td>
                                                                </tr>
                                                            </table>
                                                        </asp:View>
                                                    </asp:MultiView>
                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:PostBackTrigger ControlID="Button2" />
                                                    <asp:PostBackTrigger ControlID="Button10" />
                                                    <asp:PostBackTrigger ControlID="Button3" />
                                                </Triggers>
                                            </asp:UpdatePanel>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center">
                                            &nbsp;</td>
                                    </tr>
                                </table>
                            </asp:View>
                            <asp:View ID="View2" runat="server">
                                <table style="width: 100%; height: 253px;">
                                    <tr>
                                        <td class="style202" valign="middle">
                                            <table style=" height: 58px; width: 981px;">
                                                <tr>
                                                    <td class="style219" valign="middle">
                                                        <asp:UpdatePanel ID="UpdatePanel2" runat="server" ChildrenAsTriggers="true">
                                                            <ContentTemplate>
                                                                &nbsp; &nbsp; &nbsp; Term :
                                                                <asp:DropDownList ID="DropDownList7" runat="server" AppendDataBoundItems="true" 
                                                                    DataSourceID="SqlDataSource2" DataTextField="term_desc" 
                                                                    DataValueField="term_desc">
                                                                    <asp:ListItem>Term</asp:ListItem>
                                                                </asp:DropDownList>
                                                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                                                                    ConnectionString="<%$ ConnectionStrings:school_management_systemConnectionString %>" 
                                                                    SelectCommand="SELECT [term_desc] FROM [term]"></asp:SqlDataSource>
                                                            </ContentTemplate>
                                                        </asp:UpdatePanel>
                                                    </td>
                                                    <td>
                                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                        <asp:Button ID="Button9" runat="server" onclick="Button9_Click" 
                                                            Text="Generate" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style214">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style214">
                                            <asp:UpdatePanel ID="UpdatePanel6" runat="server">
                                                <ContentTemplate>
                                                    <asp:GridView ID="GridView3" runat="server" BackColor="#DEBA84" 
                                                        BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
                                                        CellSpacing="2" Height="155px" style="margin-left: 165px" Width="737px">
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
                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:PostBackTrigger ControlID="Button9"  />
                                                </Triggers>
                                            </asp:UpdatePanel>
                                        </td>
                                    </tr>
                                </table>
                            </asp:View>
                        </asp:MultiView>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="Button1" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="Button5" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="Button7" EventName="Click" />
                    </Triggers>
                </asp:UpdatePanel>
               
            </td>
        </tr>
    </table>
     </ContentTemplate>
                            <Triggers>
                            <asp:AsyncPostBackTrigger  ControlID="RadioButton1"  EventName="CheckedChanged"/>
                            <asp:AsyncPostBackTrigger ControlID= "RadioButton2"  EventName="CheckedChanged" />
                            </Triggers>                 
                              </asp:UpdatePanel>
</asp:Content>

