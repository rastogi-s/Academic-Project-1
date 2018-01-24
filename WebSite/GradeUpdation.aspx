<%@ Page Title="" Language="C#" MasterPageFile="~/childmasterStaff.master"  CodeFile="GradeUpdation.aspx.cs" Inherits="_Default"  AutoEventWireup="true" EnableEventValidation="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head3" Runat="Server">
    <style type="text/css">
        .style201
        {
            height: 158px;
        }
        .style206
        {
            text-align: center;
            height: 76px;
        }
        .style208
        {
            height: 46px;
            color: White;
            width: 278px;
        }
        .style209
        {
            height: 44px;
            color: White;
            font-size: large;
            width: 277px;
        }
        .style214
        {
            width: 278px;
        }
        .style220
        {
            width: 277px;
            color:Black;
        }
        .style221
        {
            height: 44px;
            color: White;
            width: 277px;
        }
        .style222
        {
            height: 44px;
            color: White;
            width: 278px;
        }
        .style223
        {
            height: 46px;
            color: White;
            width: 277px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">
    <table style="width: 100%; height: 525px;">
        <tr>
            <td  valign="top" class="style201">
                <table  style="width:100%; height:129px; color:White"  >
                    <tr>
                        <td style="text-align: center" class="style206" bgcolor="#B50D0D">
                            
                             <asp:CascadingDropDown ID="CascadingDropDown1" runat="server" Category="class2" 
                                LoadingText="[Loading class]" PromptText="Select a class" ServiceMethod="GetDropDownContents4" 
                                ServicePath="WebService.asmx" TargetControlID="DropDownList1">
                            </asp:CascadingDropDown>
                            Class :
                            <asp:DropDownList ID="DropDownList1" runat="server" Height="22px" Width="120px">
                            </asp:DropDownList>
                        </td>
                        <td class="style206" bgcolor="#B50D0D" colspan="2">
                        <asp:CascadingDropDown ID="CascadingDropDown2" runat="server" Category="sec2" 
                                LoadingText="[Loading section]" ParentControlID="DropDownList1" PromptText="Select a section" 
                                ServiceMethod="GetDropDownContents5" ServicePath="WebService.asmx" 
                                TargetControlID="DropDownList2">
                            </asp:CascadingDropDown>
                            Section :
                            <asp:DropDownList ID="DropDownList2" runat="server" Height="23px" Width="120px">
                            </asp:DropDownList>
                        </td>
                        <td class="style206" style="text-align: center" bgcolor="#B50D0D">
                            <asp:CascadingDropDown ID="CascadingDropDown6" runat="server" Category="course2" 
                                LoadingText="[Loading course]" ParentControlID="DropDownList2" 
                                PromptText=" Select a Course" ServiceMethod="GetDropDownContents6" 
                                ServicePath="WebService.asmx" TargetControlID="DropDownList3">
                            </asp:CascadingDropDown>
                            Course :
                            <asp:DropDownList ID="DropDownList3" runat="server" Height="23px" Width="120px">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="style206" colspan="2" bgcolor="#B50D0D">
                            Term :
                            <asp:DropDownList ID="DropDownList4" runat="server" Height="24px" Width="100px" 
                                DataSourceID="SqlDataSource1" DataTextField="term_desc"  AppendDataBoundItems="true"
                                DataValueField="term_desc">
                                <asp:ListItem>Term</asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:school_management_systemConnectionString %>" 
                                SelectCommand="SELECT [term_desc] FROM [term]"></asp:SqlDataSource>
                        </td>
                        <td class="style206" colspan="2" bgcolor="#B50D0D">
                            <asp:Button ID="Button1" runat="server" Height="26px" onclick="Button1_Click" 
                                Text="Update" Width="80px" />
                        </td>
                    </tr>
                    <tr>
                    <td colspan="5" style="text-align: center">
                    
                        <asp:MultiView ID="MultiView1" runat="server">
                       
                            <asp:View ID="View1" runat="server">
                             
                            <table style="width: 100%; height: 139px; margin-left: 0px;">
                    <tr>
                        <td class="style221">
                            </td>
                        <td bgcolor="#B50D0D" class="style209">
                            Full Marks</td>
                        <td class="style222">
                            </td>
                    </tr>
                    <tr>
                        <td bgcolor="#B50D0D" class="style223">
                            Unit Test:
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                            <asp:TextBox ID="TextBox4" runat="server" AutoPostBack="true" 
                                OnTextChanged="ontext"></asp:TextBox>
                              </ContentTemplate></asp:UpdatePanel>
                        </td>
                        <td bgcolor="#B50D0D" class="style223">
                            Theory :
                           <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                            <ContentTemplate>
                            <asp:TextBox ID="TextBox5" runat="server" AutoPostBack="true" OnTextChanged="ontext1" ></asp:TextBox>
                            </ContentTemplate></asp:UpdatePanel>
                        </td>
                        <td bgcolor="#B50D0D" class="style208">
                            Practical :
                         <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                            <ContentTemplate>
                            <asp:TextBox ID="TextBox6" runat="server" AutoPostBack="true" OnTextChanged="ontext2" ></asp:TextBox>
                        </ContentTemplate></asp:UpdatePanel>
                        </td>
                    </tr>
                    <tr>
                        <td class="style220">
                        
                            <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Only decimal Numbers Allowed" 
                            Type="Double" Operator="DataTypeCheck"  ValidationGroup="g"  ControlToValidate="TextBox4" Display="Dynamic" ></asp:CompareValidator>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Field Cannot Be Empty"
                            ValidationGroup="g"  ControlToValidate="TextBox4" Display="Dynamic"></asp:RequiredFieldValidator>
                         
                        </td>
                        <td class="style220">
                        <asp:CompareValidator ID="CompareValidator2" runat="server" ErrorMessage="Only decimal Numbers Allowed" 
                            Type="Double" Operator="DataTypeCheck"  ValidationGroup="g"  ControlToValidate="TextBox5"  Display="Dynamic"></asp:CompareValidator>
                           <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Field Cannot Be Empty"
                            ValidationGroup="g"  ControlToValidate="TextBox5" Display="Dynamic"></asp:RequiredFieldValidator> &nbsp;</td>
                        <td class="style220">
                        <asp:CompareValidator ID="CompareValidator3" runat="server" ErrorMessage="Only decimal Numbers Allowed" 
                            Type="Double" Operator="DataTypeCheck"  ValidationGroup="g"  ControlToValidate="TextBox6"  Display="Dynamic"></asp:CompareValidator>
                           <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Field Cannot Be Empty"
                            ValidationGroup="g"  ControlToValidate="TextBox6" Display="Dynamic"></asp:RequiredFieldValidator> &nbsp;</td>
                    </tr>
                </table>
                
                            </asp:View>
                        </asp:MultiView></td>
                    
                    </tr>
                    </table>
            </td>
        </tr>
        <tr>
            <td   valign="top" style="text-align: center; "  >
                <br />
                
                <br />
                 <asp:UpdatePanel ID="UpdatePanel4" runat="server"  >
                            <ContentTemplate>
                <asp:GridView ID="GridView1" runat="server" Height="122px" Width="843px" 
                    BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" 
                    CellPadding="3" CellSpacing="2" AllowPaging="True" 
                    AutoGenerateColumns="False" DataSourceID="SqlDataSource2" 
                    style="margin-left: 73px">
                    <Columns>
                        <asp:BoundField DataField="Reg_No." HeaderText="Reg_No." 
                            SortExpression="Reg_No."  />
                        <asp:BoundField DataField="Roll_No" HeaderText="Roll_No" 
                            SortExpression="Roll_No" />
                        <asp:BoundField DataField="Name" HeaderText="Name" ReadOnly="True" 
                            SortExpression="Name"  />
                            <asp:TemplateField HeaderText="Unit Test">
                <ItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    <asp:CompareValidator ID="CompareValidator6" runat="server" ErrorMessage="Only decimal Numbers Allowed" 
                            Type="Double" Operator="DataTypeCheck"  ValidationGroup="g"  ControlToValidate="TextBox1"  Display="Dynamic" 
                             ></asp:CompareValidator>
                             <asp:CompareValidator ID="CompareValidator7" runat="server" ErrorMessage="Cannot be Greater Than Full Marks" 
                            Operator="LessThanEqual"  ValidationGroup="g"  ControlToValidate="TextBox1"  Display="Dynamic" 
                             ></asp:CompareValidator>
                </ItemTemplate>
                </asp:TemplateField >
                <asp:TemplateField HeaderText="Theory ">
                <ItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                    <asp:CompareValidator ID="CompareValidator4" runat="server" ErrorMessage="Only decimal Numbers Allowed" 
                            Type="Double" Operator="DataTypeCheck"  ValidationGroup="g"  ControlToValidate="TextBox2"  Display="Dynamic" 
                             ></asp:CompareValidator>
                             <asp:CompareValidator ID="CompareValidator9" runat="server" ErrorMessage="Cannot be Greater Than Full Marks" 
                             Operator="LessThanEqual"  ValidationGroup="g"  ControlToValidate="TextBox2"   Display="Dynamic" 
                             ></asp:CompareValidator>
                </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Practical">
                <ItemTemplate>
                <asp:TextBox ID="TextBox3" runat="server" ></asp:TextBox>
                <asp:CompareValidator ID="CompareValidator5" runat="server" ErrorMessage="Only decimal Numbers Allowed" 
                            Type="Double" Operator="DataTypeCheck"  ValidationGroup="g"  ControlToValidate="TextBox3"  Display="Dynamic" 
                             ></asp:CompareValidator>
                             <asp:CompareValidator ID="CompareValidator8" runat="server" ErrorMessage="Cannot be Greater Than Full Marks" 
                            Operator="LessThanEqual"  ValidationGroup="g"  ControlToValidate="TextBox3"   Display="Dynamic" 
                             ></asp:CompareValidator>
                    
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
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
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
                                
                </ContentTemplate><Triggers>
                <asp:AsyncPostBackTrigger  ControlID="TextBox4" EventName="TextChanged"/>
                <asp:AsyncPostBackTrigger  ControlID="TextBox5" EventName="TextChanged"/>
                <asp:AsyncPostBackTrigger  ControlID="TextBox6" EventName="TextChanged"/>
                </Triggers></asp:UpdatePanel>
                <asp:HiddenField ID="HiddenField1" runat="server" />
                <br />
                <asp:Button ID="Button2" runat="server" Height="27px" onclick="Button2_Click" 
                    style="margin-left: 0px" Text="Submit" Width="93px" Visible="false"  ValidationGroup="g"/>
&nbsp;
            </td>
        </tr>
        </table>
</asp:Content>

