<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="home_page.aspx.cs" Inherits="home_page" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
  
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <style type="text/css">
        .style27
        {
            height: 164px;
            
        }
        .style28
        {
            height: 20px;
        }
        .style29
        {
            width: 220px;
            height: 226px;
            margin-left: 0px;
        }
        .style30
        {
            height: 164px;
            width: 183px;
            padding-bottom:50px;
            padding-left:100px;
        }
        .style31
        {
            height: 164px;
            width: 540px;
            padding-left:50px;
            padding-right:30px;
            padding-bottom:50px;
        }
        .style33:hover
        {
            font-weight: bold;
            color:Blue;
        }
        
        .style32
        {
            font-size: x-large;
        }
        .style80
        {
            width: 220px;
            height: 226px;
            margin-left: 0px;
            margin-top:5px;
            vertical-align:top;
        }
        
    </style>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <table style="width: 102%; height: 333px;">
        <tr>
            <td>
            <asp:Image ImageUrl="~/Slides/16.jpg" runat="server" ID="image" Height="426" Width="720" />
            <asp:SlideShowExtender ID="SlideShowExtender3" runat="server" AutoPlay="true" Loop="true"
                 Enabled="true"  TargetControlID="image" SlideShowServiceMethod="getslide">
                </asp:SlideShowExtender>
            </td>
        </tr>
        </table>
        <br />
        
    <asp:Panel ID="Panel1" runat="server" BackColor="White">
    <table style="width: 102%; height: 240px;">
        <tr>
            <td class="style28" colspan="3">
                &nbsp;
                &nbsp;
                &nbsp;
            </td>
        </tr>
            <tr >
                <td bgcolor="White" class="style30">
                    &nbsp; &nbsp;
                     <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>
                    
                    <asp:MultiView ID="MultiView1"  ActiveViewIndex="0" runat="server">
                        <asp:View ID="View1" runat="server"> 
                        <img class="style29" src="logo-school-hi.png"  />
                        </asp:View>
                        <asp:View ID="View2" runat="server">
                            <img src="Slides/ic_launcher-web.png" class="style80" />
                        </asp:View>
                    </asp:MultiView>
                    </ContentTemplate>
                    <Triggers>
                    <asp:AsyncPostBackTrigger  ControlID="HyperLink2" EventName="Click"/>
                    </Triggers>
                    </asp:UpdatePanel>
                </td>
                <td align="center" bgcolor="White" class="style31">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                    
                    <asp:MultiView ID="MultiView2" runat="server" ActiveViewIndex="0">
                        <asp:View ID="View3" runat="server" >
                        
                    &nbsp; &nbsp;
                    <p style="margin: 8px 0px; padding: 0px 0px 8px;  font-family: 'Liberation sans', Arial, Helvetica, sans-serif; font-size: 12px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 18px; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; windows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-align: left;">
                        Welcome to ABC School, Ranchi Founded in 2013 the school 
                        is modern and attractive in both layout and construction. The school is run by 
                        the order of t he Shubham of ABC that has a network of educational institutions 
                        in over 130 countries of the world. The aim of the school is the all round 
                        formation of the students to make them good human beings and worthy citizens of 
                        the country that is rich in diverse cultures, religions, languages and customs.</p>
                    <p 
                        
                                style="margin: 8px 0px; padding: 0px 0px 8px; color: rgb(153, 153, 153); font-family: 'Liberation sans', Arial, Helvetica, sans-serif; font-size: 12px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 18px; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; windows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(249, 251, 250); text-align: left;">
                        <font color="#666666">The method of education followed is the system taught and 
                        practiced by Don Bosco- the Preventive System</font></p>
                        </asp:View>
                        <asp:View ID="View4" runat="server" >

                            <table style="width: 100%;">
                                <tr>
                                    <td bgcolor="#B50D0D" 
                                        style="text-align: left; color: #FFFFFF; font-weight: 700; font-size: larger">
                                        &nbsp; &nbsp; &nbsp; <span class="style32">Principal&#39;s Desk........</span></td>
                                </tr>
                                <tr>
                                    <td style="text-align: left">
                                        &nbsp;Education is the backbone of society. It is a Challenging task to develop the 
                                        complete personality of the students. We are committed to provide quality 
                                        education to develop the personality of the future citizens of a dynamic and 
                                        pulsating nation. We make a concrete effort towards the development of 
                                        academics, sports and other activities to make each of our students a wholesome 
                                        entity.<br />
                                        <br />
                                        We, at Oxford Public School have undertaken the task of creating worthy citizens 
                                        of the country by exploring the various facets of education. In the changing 
                                        scenario, we shall imbibe all the possibilities of wisdom and create Oxford 
                                        Public School as a true center of excellence.<br />
                                        <br />
                                        We believe that our students deserve quality education in an environment, which 
                                        is structured, disciplined, challenging, stimulating and caring.<br />
                                        <br />
                                        We provide a challenging and stimulating environment to facilitate the 
                                        intellectual, creative, social, emotional and personal development of our 
                                        students.<br /> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                    </td>
                                </tr>
                            </table>

                        </asp:View>
                         </asp:MultiView>
                </ContentTemplate>
                    <Triggers>
                    <asp:AsyncPostBackTrigger  ControlID="HyperLink2" EventName="Click"/>
                    </Triggers>
                    </asp:UpdatePanel>
                </td>
                <td bgcolor="White" class="style27" style="padding-left:30px; padding-right:100px; font-size:large;  padding-bottom:50px;  ">
                   
                    <asp:HyperLink ID="HyperLink1" runat="server" Font-Underline="false"   NavigateUrl="~/PicViewer.aspx" ForeColor="GrayText" CssClass="style33" >Photo Gallery</asp:HyperLink>
                    <hr />
                    <asp:LinkButton ID="HyperLink2" runat="server" Font-Underline="false"  
                        ForeColor="GrayText" CssClass="style33" onclick="HyperLink2_Click"  >Principal</asp:LinkButton>
                    <hr />
                    <asp:HyperLink ID="HyperLink3" runat="server" Font-Underline="false" NavigateUrl="" ForeColor="GrayText" CssClass="style33">Activities and Co-curricular </asp:HyperLink>
                    <hr />
                    <asp:HyperLink ID="HyperLink4" runat="server" Font-Underline="false" NavigateUrl="" ForeColor="GrayText" CssClass="style33">Notice Board and Circular</asp:HyperLink>
                    <hr />
                    <asp:HyperLink ID="HyperLink5" runat="server" Font-Underline="false" NavigateUrl="" ForeColor="GrayText" CssClass="style33">Academics(Syllabus and Notes)</asp:HyperLink>
                    <hr />
                    <asp:HyperLink ID="HyperLink6" runat="server" Font-Underline="false" NavigateUrl="~/Faculty.aspx" CssClass="style33"  ForeColor="GrayText" >Faculty</asp:HyperLink>
                    <hr />
                   
                </td>
            </tr>
        </caption>
        </table>
        </asp:Panel>
    
    
</asp:Content>

