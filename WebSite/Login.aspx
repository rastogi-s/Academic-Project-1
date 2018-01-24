<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <style type="text/css">
        .style25
        {
            width: 128px;
        }
       
        .style28
        {
           
            height: 471px;
            width: 595px;
        }
        .style29
        {
            
        }
       
        .style30
        {
           
            padding-left: 80px;
            width:50%
        }
       
        .style31
        {
            height: 60px;
        }
        .style32
        {
            height: 60px;
            width: 216px;
        }
        .style34
        {
            height: 60px;
            width: 223px;
            text-align: left;
        }
        .style35
        {
            width: 223px;
        }
        .style36
        {
            width: 216px;
        }
               
        #Text1
        {
            width: 208px;
            height: 31px;
        }
        
       
        .style44
        {
            height: 74px;
            width: 216px;
            text-align: left;
        }
        .style45
        {
            height: 74px;
            width: 223px;
            vertical-align: middle;
            text-align: left;
        }
        .style46
        {
            height: 74px;
            font-size: medium;
            text-align: left;
        }
        .style47
        {
            vertical-align:middle;
           
        }
        
       
        .style52
        {
            width: 212px;
            height: 89px;
            text-align: left;
        }
        .style54
        {
            height: 63px;
            text-align: left;
        }
        .style56
        {
            width: 160px;
            height: 89px;
        }
        .style61
        {
            width: 212px;
            text-align: left;
            height: 63px;
        }
        .style63
        {
            height: 89px;
            text-align: left;
        }
        .style64
        {
            width: 160px;
            text-align: left;
            height: 53px;
        }
        .style65
        {
            width: 212px;
            text-align: left;
            height: 53px;
        }
        .style66
        {
            height: 53px;
            text-align: left;
        }
        .style68
        {
            width: 212px;
            text-align: left;
            height: 63px;
        }
        .style71
        {
            height: 63px;
        }
        .style72
        {
            width: 127px;
            text-align: center;
        }
        .style75
        {
            width: 160px;
            text-align: left;
            height: 63px;
        }
        .style76
        {
            width: 160px;
            text-align: left;
        }
        .style77
        {
            width: 137px;
            text-align: left;
        }
        
       
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script type="text/javascript">
    function runPostback() {
        document.forms["form1"].submit();
        document.getElementById("TextBox1").focus();
    }
    function getFocus() {
        var text = document.getElementById("TextBox1");
        if (text != null && text.value.length > 0) {
            if (text.createTextRange) {
                var FieldRange = text.createTextRange();
                FieldRange.moveStart('character', text.value.length);
                FieldRange.collapse();
                FieldRange.select();
            } 
        }
    }

    function SetDelay() {
        setTimeout("runPostback()", 200);
    }




 </script>
    <table style="width: 100%; height: 555px;">
        <tr>
            <td class="style30">
                
                <img class="style28" src="Slides/14.jpg" /></td>
            <td class="style29">
                &nbsp;
                &nbsp;
               
                <table style=" height: 501px;">
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            
                                
                            <asp:Panel ID="Panel1" runat="server" Height="369px" Width="562px"  
                                BackColor="#B50D0D"  ForeColor="White"
                                
                                style="margin-left: 39px; text-align: center; margin-bottom: 13px; vertical-align:middle" 
                                Font-Bold="False" Font-Size="Large">
              
                                <table style="width:100%; height: 368px;">
                                    <tr>
                                        <td class="style56">
                                            </td>
                                        <td class="style52" colspan="2">
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="Larger" 
                                                ForeColor="White" Text="LOGIN"></asp:Label>
                                        </td>
                                        <td class="style63">
                                            </td>
                                    </tr>
                                    <tr>
                                        <td class="style64">
                                            &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; User ID :</td>
                                        <td class="style65" colspan="2">
                                            <asp:TextBox ID="TextBox1" runat="server" Height="31px" Width="219px"></asp:TextBox>
                                        </td>
                                        <td class="style66">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                               ValidationGroup="g"    ControlToValidate="TextBox1" ErrorMessage="Please enter UserName"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style75">
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Password&nbsp;:</td>
                                        <td class="style61" colspan="2">
                                            <asp:TextBox ID="TextBox2" runat="server" Height="31px" Width="219px" TextMode="Password" MaxLength="16" ></asp:TextBox>
                                        </td>
                                        <td class="style54">
                                           <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                              ValidationGroup="g"   ControlToValidate="TextBox2" ErrorMessage="Please enter Password"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style75">
                                            </td>
                                        <td class="style68" colspan="2">
                                            <asp:Button ID="Button1" runat="server" Height="29px" onclick="Button1_Click" 
                                                Text="Login" Width="75px" ValidationGroup="g" />
                                        </td>
                                        <td class="style71">
                                            </td>
                                    </tr>
                                    <tr>
                                        <td class="style76">
                                            &nbsp;</td>
                                        <td class="style77">
                                            <asp:HyperLink ID="HyperLink1" runat="server" Font-Underline="True" 
                                                ForeColor="White">Forgot Password</asp:HyperLink>
                                            &nbsp;|</td>
                                        <td class="style72">
                                            <asp:HyperLink ID="HyperLink2" runat="server" Font-Underline="True">Reset Password</asp:HyperLink>
                                        </td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    
                                </table>
                                
                            </asp:Panel>
                            
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td class="style30">
                
                &nbsp;</td>
            <td class="style29">
                &nbsp;
            </td>
        </tr>
    </table>
</asp:Content>

