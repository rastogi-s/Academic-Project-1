<%@ Page Title="" Language="C#" MasterPageFile="~/childmasterStudent.master" AutoEventWireup="true" CodeFile="Profile_stud.aspx.cs" Inherits="_Default" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head2" Runat="Server">
    <style type="text/css">
        #TextArea1
        {
            height: 126px;
            width: 279px;
        }
       
        .style61
        {
            height: 36px;
            width: 95%;
            text-align: center;
            font-size: x-large;
        }
        .style112
        {
            height: 50px;
            width: 131px;
        }
        .style113
        {
            height: 50px;
            width: 72%;
        }
        .style114
        {
            height: 97px;
            width: 260px;
        }
        .style115
        {
            height: 97px;
            width: 72%;
        }
        .style120
        {
            height: 52px;
            width: 260px;
        }
        .style121
        {
            height: 52px;
            width: 72%;
        }
        .style124
        {
            height: 43px;
            width: 260px;
        }
        .style125
        {
            height: 43px;
            width: 72%;
        }
        .style130
        {
            height: 59px;
            width: 260px;
        }
        .style131
        {
            height: 59px;
            width: 72%;
        }
        .style132
        {
            height: 60px;
            width: 157px;
        }
        .style133
        {
            height: 60px;
            width: 72%;
        }
        .style134
        {
            height: 173px;
            width: 260px;
        }
        .style135
        {
            height: 173px;
            width: 72%;
        }
        .style136
        {
            height: 55px;
            width: 260px;
        }
        .style137
        {
            height: 55px;
            width: 72%;
        }
        .style138
        {
            height: 85px;
            width: 131px;
        }
        .style139
        {
            height: 85px;
            width: 72%;
        }
        .style140
        {
            height: 62px;
            width: 157px;
        }
        .style141
        {
            height: 62px;
            width: 72%;
        }
        .style142
        {
            height: 56px;
            width: 260px;
        }
        .style143
        {
            height: 56px;
            width: 72%;
        }
        .style148
        {
            height: 103px;
            width: 157px;
        }
        .style149
        {
            height: 103px;
            width: 72%;
        }
        .style150
        {
            height: 166px;
            width: 157px;
        }
        .style151
        {
            height: 166px;
            width: 72%;
        }
        #TextArea2
        {
            height: 91px;
            width: 190px;
        }
        #TextArea4
        {
            height: 126px;
            width: 279px;
        }
        .style152
        {
            height: 63px;
            width: 157px;
        }
        .style153
        {
            height: 63px;
            width: 72%;
        }
        .style154
        {
            height: 61px;
            width: 157px;
        }
        .style155
        {
            height: 61px;
            width: 72%;
        }
        .style156
        {
            height: 90px;
            width: 157px;
        }
        .style157
        {
            height: 90px;
            width: 72%;
        }
        .style158
        {
            height: 65px;
            width: 157px;
        }
        .style159
        {
            height: 65px;
            width: 72%;
        }
        .style162
        {
            height: 32px;
            width: 95%;
            text-align: center;
            font-size: x-large;
        }
        .style163
        {
            height: 57px;
            width: 131px;
        }
        .style164
        {
            height: 57px;
            width: 72%;
        }
        .style167
        {
            height: 108px;
            width: 131px;
        }
        .style168
        {
            height: 108px;
            width: 72%;
        }
        .style169
        {
            height: 77px;
            width: 131px;
        }
        .style170
        {
            height: 77px;
            width: 72%;
        }
        .style171
        {
            height: 72px;
            width: 131px;
        }
        .style172
        {
            height: 72px;
            width: 72%;
        }
        .style173
        {
            height: 67px;
            width: 95%;
            text-align: left;
            font-size: x-large;
        }
        .style174
        {
            height: 67px;
            width: 260px;
            text-align: left;
            font-size: x-large;
        }
        .style175
        {
            height: 60px;
            width: 260px;
        }
        .style176
        {
            height: 85px;
            width: 260px;
        }
        .style177
        {
            height: 62px;
            width: 260px;
        }
        .style178
        {
            height: 61px;
            width: 131px;
        }
        
    </style>
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <table style="width: 99%; height:100%; color: #FFFFFF; padding-left:15px; margin-bottom: 0px;" >
        <tr>
        <td align="center">
            <asp:Button ID="Button1" runat="server" Text="Student's Personal Details" 
                onclick="Button1_Click" />
            &nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button2" runat="server" Text="Student's Acdemic Details" 
                onclick="Button2_Click" />
            &nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button3" runat="server" Text="Student's Guardian Details" 
                onclick="Button3_Click" />
        </td>
        </tr>
        <tr>
        
            <td  valign="top">
                <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
                    <asp:View ID="View1" runat="server" >
                         <table style="width: 99%; height:810px; color: #FFFFFF;" bgcolor="White">
       
        <tr>
           
            <td  bgcolor="White" colspan="2" class="style61" >
                <strong style="color: #000000">Student&#39;s Profile</strong></td>
            
        </tr>
                             <tr>
                                 <td bgcolor="White" class="style174">
                                     &nbsp;&nbsp;&nbsp;<img alt="Pic not Availale" id="Img1" runat="server"  style="height:200px; width: 174px; margin-top: 8px;"  /></td>
                                 <td bgcolor="White" class="style173">
                                 </td>
                             </tr>
        <tr>
            
            <td class="style114" bgcolor="#B50D0D" >
                &nbsp;&nbsp;&nbsp; Student&#39;s Name :&nbsp;</td>
            <td class="style115" bgcolor="#B50D0D">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; First Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                Middle Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                LastName<br />
                <br />
&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="TextBox1" runat="server" Height="28px" Width="157px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="TextBox2" runat="server" Height="28px" Width="158px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="TextBox3" runat="server" Height="28px" Width="157px"></asp:TextBox>
            </td>
            
        </tr>
        <tr>
            
            <td class="style130" bgcolor="#B50D0D">
                &nbsp;&nbsp;&nbsp; DOB :</td>
            <td class="style131" bgcolor="#B50D0D">
                &nbsp;&nbsp;&nbsp;
                <asp:CalendarExtender ID="CalendarExtender1" runat="server" 
                    TargetControlID="TextBox30">
                </asp:CalendarExtender>
                <asp:TextBox ID="TextBox30" runat="server" Height="29px" Width="100px"></asp:TextBox>
                &nbsp;</td>
            
        </tr>
        <tr>
            
            <td class="style175" bgcolor="#B50D0D">
                &nbsp;&nbsp;&nbsp;Sex :</td> <td class="style133" bgcolor="#B50D0D">
                <asp:RadioButton ID="RadioButton1" runat="server"  GroupName="sex" Text="Male" 
                    ForeColor="White" style=" margin-left:20px;"  />
                <asp:RadioButton ID="RadioButton2" runat="server" GroupName="sex" Text="Female" 
                    ForeColor="White" style="margin-left: 30px;" />
                <br />
            </td>
            
        </tr>
       
        <tr>
            
            <td class="style134" bgcolor="#B50D0D">
                &nbsp;&nbsp; Address :&nbsp;</td>
            <td class="style135" bgcolor="#B50D0D" style="padding-left:20px;">
                <textarea id="TextArea1" name="S1" runat=server rows=10 cols=20 ></textarea></td>
          
        </tr>
        <tr>
            
            <td class="style136" bgcolor="#B50D0D">
                &nbsp;&nbsp; Postal Code :&nbsp;</td>
            <td class="style137" bgcolor="#B50D0D" style="padding-left:20px;">
                <asp:TextBox ID="TextBox7" runat="server" Width="94px" MaxLength="6" 
                    Height="24px"></asp:TextBox>
            </td>
            
        </tr>
        <tr>
            
            <td class="style120" bgcolor="#B50D0D">
                &nbsp;&nbsp; Phone( Mobile No.) :</td>
            <td class="style121" bgcolor="#B50D0D" style="padding-left:20px;">
                <asp:TextBox ID="TextBox8" runat="server" MaxLength="10" Width="117px" 
                    Height="24px" ></asp:TextBox>
            </td>
            
        </tr>
        <tr>
            
            <td class="style176" bgcolor="#B50D0D">
                &nbsp;&nbsp; Phone( Telephone No.) :&nbsp;</td>
            <td class="style139" bgcolor="#B50D0D">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Code&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                Number&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
                <br />
&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="TextBox9" runat="server" Height="22px" Width="54px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="TextBox10" runat="server" Height="22px" Width="122px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;
                </td>
            
        </tr>
        <tr>
            
            <td class="style177" bgcolor="#B50D0D">
                &nbsp;&nbsp; Email-ID :&nbsp;</td>
            <td class="style141" bgcolor="#B50D0D">
                &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="TextBox11" runat="server" Width="226px" Height="24px"></asp:TextBox>
            </td>
           
        </tr>
        <tr>
           
            <td class="style142" bgcolor="#B50D0D">
                &nbsp;&nbsp;&nbsp; Blood Group :</td>
            <td class="style143" bgcolor="#B50D0D">
                &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="TextBox12" runat="server" Width="36px" MaxLength="3"></asp:TextBox>
            </td>
           
        </tr>
        <tr>
            
            <td class="style124" bgcolor="#B50D0D">
                &nbsp;&nbsp; Nationality :&nbsp;</td>
            <td class="style125" bgcolor="#B50D0D">
                &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="TextBox34" runat="server" Height="24px" MaxLength="10" 
                    Width="198px"></asp:TextBox>
            </td>
           
        </tr>
      
    </table>
                    </asp:View>
                    <asp:View ID="View2" runat="server">
                
                     <table style="width: 100%; height:100%; color: #FFFFFF;" bgcolor="White">
       
        <tr>
           
            <td  bgcolor="White" colspan="2" class="style61" >
                <strong style="color: #000000">Guardian&#39;s Details</strong></td>
            
        </tr>
        <tr>
            
            <td class="style148" bgcolor="#B50D0D" >
                &nbsp;&nbsp;&nbsp; Guardian&#39;s Name :&nbsp;</td>
            <td class="style149" bgcolor="#B50D0D">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; First Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                Middle Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                LastName<br />
                <br />
&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="TextBox4" runat="server" Height="28px" Width="157px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="TextBox5" runat="server" Height="28px" Width="158px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="TextBox6" runat="server" Height="28px" Width="157px"></asp:TextBox>
            </td>
            
        </tr>
        <tr>
            
            <td class="style130" bgcolor="#B50D0D">
                &nbsp;&nbsp;&nbsp; DOB :</td>
            <td class="style131" bgcolor="#B50D0D">
                &nbsp;&nbsp;&nbsp;
                <asp:CalendarExtender ID="CalendarExtender2" runat="server" 
                    TargetControlID="TextBox30">
                </asp:CalendarExtender>
                <asp:TextBox ID="TextBox18" runat="server" Height="29px" Width="100px"></asp:TextBox>
                &nbsp;</td>
            
        </tr>
        <tr>
            
            <td class="style132" bgcolor="#B50D0D">
                &nbsp;&nbsp;&nbsp;Sex : </td><td class="style133" bgcolor="#B50D0D">
                <asp:RadioButton ID="RadioButton3" runat="server"  GroupName="sex" Text="Male" 
                    ForeColor="White" style=" margin-left:20px;"  />
                <asp:RadioButton ID="RadioButton4" runat="server" GroupName="sex" Text="Female" 
                    ForeColor="White" style="margin-left: 30px;" />
                <br />
            </td>
            
        </tr>
       
        <tr>
            
            <td class="style150" bgcolor="#B50D0D">
                &nbsp;&nbsp; Address :&nbsp;</td>
            <td class="style151" bgcolor="#B50D0D" style="padding-left:20px;">
                <textarea id="TextArea4" name="S2" cols="20" rows="10" runat=server ></textarea></td>
          
        </tr>
        <tr>
            
            <td class="style152" bgcolor="#B50D0D">
                &nbsp;&nbsp; Postal Code :&nbsp;</td>
            <td class="style153" bgcolor="#B50D0D" style="padding-left:20px;">
                <asp:TextBox ID="TextBox13" runat="server" Width="94px" MaxLength="6" 
                    Height="24px"></asp:TextBox>
            </td>
            
        </tr>
        <tr>
            
            <td class="style154" bgcolor="#B50D0D">
                &nbsp;&nbsp; Phone( Mobile No.) :</td>
            <td class="style155" bgcolor="#B50D0D" style="padding-left:20px;">
                <asp:TextBox ID="TextBox14" runat="server" MaxLength="10" Width="117px" 
                    Height="24px" ></asp:TextBox>
            </td>
            
        </tr>
        <tr>
            
            <td class="style156" bgcolor="#B50D0D">
                &nbsp;&nbsp; Phone( Telephone No.) :&nbsp;</td>
            <td class="style157" bgcolor="#B50D0D">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Code&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                Number&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
                <br />
&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="TextBox15" runat="server" Height="22px" Width="54px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="TextBox16" runat="server" Height="22px" Width="122px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;
                </td>
            
        </tr>
        <tr>
            
            <td class="style158" bgcolor="#B50D0D">
                &nbsp;&nbsp; Email-ID :&nbsp;</td>
            <td class="style159" bgcolor="#B50D0D">
                &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="TextBox17" runat="server" Width="226px" Height="24px"></asp:TextBox>
            </td>
           
        </tr>
       
        <tr>
            
            <td class="style140" bgcolor="#B50D0D">
                &nbsp;&nbsp; Nationality :&nbsp;</td>
            <td class="style141" bgcolor="#B50D0D">
                &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="TextBox35" runat="server" Height="24px" MaxLength="10" 
                    Width="198px"></asp:TextBox>
            </td>
           
        </tr>
       
      
    </table>


                   
                    </asp:View>
                    <asp:View ID="View3" runat="server">

            <table style="width: 99%; height:100%; color: #FFFFFF;" bgcolor="White">
       
        <tr>
           
            <td  bgcolor="White" colspan="2" class="style162" >
                <strong style="color: #000000">Academic&#39;s Details</strong></td>
            
        </tr>
        <tr>
            
            <td class="style178" bgcolor="#B50D0D" >
                &nbsp;&nbsp;&nbsp; Regn. No :&nbsp;</td>
            <td class="style155" bgcolor="#B50D0D">
               
                &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="TextBox26" runat="server" Height="25px" Width="126px"></asp:TextBox>
                &nbsp;</td>
            
        </tr>
        
        <tr>
            
            <td class="style163" bgcolor="#B50D0D">
                &nbsp;&nbsp; Class : <td class="style164" bgcolor="#B50D0D">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="TextBox32" runat="server" 
                        Height="25px" Width="56px"></asp:TextBox>
                <br />
            </td>
            
        </tr>
       
        <tr>
            
            <td class="style112" bgcolor="#B50D0D">
                &nbsp;&nbsp; Section :&nbsp;</td>
            <td class="style113" bgcolor="#B50D0D" style="padding-left:20px;">
                <asp:TextBox ID="TextBox33" runat="server" Height="25px" Width="56px"></asp:TextBox>
            </td>
          
        </tr>
        <tr>
            
            <td class="style171" bgcolor="#B50D0D">
                &nbsp;&nbsp; Roll No. :&nbsp;</td>
            <td class="style172" bgcolor="#B50D0D" style="padding-left:20px;">
                <asp:TextBox ID="TextBox36" runat="server" Width="94px" MaxLength="6" 
                    Height="24px"></asp:TextBox>
            </td>
            
        </tr>
        <tr>
            
            <td class="style169" bgcolor="#B50D0D">
                &nbsp;&nbsp; Year of Joining :</td>
            <td class="style170" bgcolor="#B50D0D" style="padding-left:20px;">
                <asp:TextBox ID="TextBox37" runat="server" Height="24px" MaxLength="6" 
                    Width="78px"></asp:TextBox>
            </td>
            
        </tr>
        <tr>
            
            <td class="style167" bgcolor="#B50D0D">
                &nbsp;&nbsp; Courses for current academic year :&nbsp;</td>
            <td class="style168" bgcolor="#B50D0D">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                
                &nbsp;&nbsp;&nbsp;&nbsp; Course ID.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Course Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Facutly<br /> 
                &nbsp;&nbsp;&nbsp;&nbsp;
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:DropDownList ID="DropDownList7" runat="server" Height="28px" 
                    onselectedindexchanged="DropDownList7_SelectedIndexChanged" AutoPostBack="true" >
                </asp:DropDownList>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="TextBox31" runat="server"></asp:TextBox>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="TextBox28" runat="server"></asp:TextBox>
                </ContentTemplate>
                <Triggers>
                <asp:AsyncPostBackTrigger ControlID="DropDownList7" EventName="SelectedIndexChanged" />
                </Triggers>
                </asp:UpdatePanel>
                </td>
            
        </tr>
       
       
      
                <tr>
                    <td bgcolor="#B50D0D" class="style138">
                        &nbsp;&nbsp; House :&nbsp;</td>
                    <td bgcolor="#B50D0D" class="style139">
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:TextBox ID="TextBox29" runat="server"></asp:TextBox>
                        &nbsp;</td>
                </tr>
       
       
      
    </table>

                    </asp:View>
                    
                </asp:MultiView>

             </td>
        </tr>
        </table>
</asp:Content>

