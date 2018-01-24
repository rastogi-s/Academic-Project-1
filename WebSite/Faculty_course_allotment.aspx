<%@ Page Title="" Language="C#" MasterPageFile="~/childmasterStaff.master" AutoEventWireup="true" CodeFile="Faculty_course_allotment.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head3" Runat="Server">
    <style type="text/css">
        .style30
        {
            width: 423px;
        }
        .style31
        {
            width: 62px;
        }
        .style33
        {
            width: 423px;
            height: 239px;
        }
        .style34
        {
            width: 62px;
            height: 239px;
        }
        .style36
        {
            width: 80px;
        }
        .style37
        {
            background-color:#b50d0d;
            width: 40px;
        }
        .style38
        {
            background-color: #b50d0d;
            color: #FFFFFF;
            width: 64px;
        }
        .style42
        {
            width: 77px;
            height: 239px;
        }
        .style43
        {
            width: 77px;
        }
        .style45
        {
            height: 28px;
        }
        .style46
        {
            height: 41px;
        }
        .style47
        {
            width: 70px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">
    <table style="width: 100%; height: 100%">
        
        <tr>
            <td class="style43">
                &nbsp;</td>
            <td class="style30">
                <table style="width: 104%; height: 237px; margin-left: 17px;">
                    <tr>
                        <td class="style38" 
                            style="font-weight: 700; background-color: #B50D0D; color: #FFFFFF;">
                            &nbsp;&nbsp;&nbsp;&nbsp; Class :&nbsp;</td>
                        <td bgcolor="#B50D0D" class="style36">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:TextBox ID="TextBox5" runat="server" Width="58px"></asp:TextBox>
                        &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="g" 
                                Display="Dynamic" ErrorMessage="Field cannot empty" ForeColor="White" ControlToValidate="TextBox5"></asp:RequiredFieldValidator>
                        </td>
                        <td class="style37">
                            &nbsp; &nbsp;<strong style="background-color: #B50D0D; color: #FFFFFF;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Section :</strong></td>
                        <td bgcolor="#B50D0D" class="style47">
                            &nbsp;&nbsp; &nbsp;<asp:TextBox ID="TextBox6" runat="server" Width="48px"></asp:TextBox>
                        &nbsp;
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="g"
                                Display="Dynamic" ErrorMessage="Field cannot empty" ForeColor="White" ControlToValidate="TextBox6"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style38">
                            &nbsp;&nbsp;&nbsp;&nbsp; <strong style="color: #FFFFFF">Course Name :</strong>&nbsp;</td>
                        <td colspan="3" bgcolor="#B50D0D">
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:DropDownList ID="DropDownList1" runat="server" Height="23px" Width="143px">
                                <asp:ListItem>Select Course</asp:ListItem>
                            </asp:DropDownList>
                            &nbsp;&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator3" 
                                runat="server" ValidationGroup="p"
                                Display="Dynamic" ErrorMessage="Course not selected" ForeColor="White" 
                                ControlToValidate="DropDownList1" InitialValue="Select Course" ></asp:RequiredFieldValidator>
                        &nbsp;<asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
                                Text="Get Courses" Width="86px" ValidationGroup="g" />
                        </td>
                    </tr>
                    <tr>
                        <td class="style38">
                            &nbsp;&nbsp;&nbsp; <strong>Faculty Id :</strong>&nbsp;</td>
                        <td colspan="3" bgcolor="#B50D0D">
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;<asp:TextBox ID="TextBox7" runat="server" Width="102px"></asp:TextBox>
                        &nbsp;&nbsp;&nbsp;
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" 
                                runat="server" ValidationGroup="p"
                                Display="Dynamic" ErrorMessage="Field cannot be empty" ForeColor="White" 
                                ControlToValidate="TextBox7"  ></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td  colspan="4" bgcolor="#B50D0D" class="style46" style="text-align: center">
                          <asp:Button ID="Button2" runat="server" onclick="Button2_Click" Text="Update" OnClientClick="return Validate()" 
                           Width="79px" />
                            <script type="text/javascript">
                                function Validate() {
                                    var isValid = false;
                                    isValid = Page_ClientValidate('g');
                                    if (isValid) {
                                        isValid = Page_ClientValidate('p');
                                    }
                                    return isValid;
                                }
                            </script>
                            </td>
                    </tr>
                </table>
            </td>
            <td class="style31">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style42">
                </td>
            <td class="style33">
                </td>
            <td class="style34">
                </td>
        </tr>
    </table>
</asp:Content>

