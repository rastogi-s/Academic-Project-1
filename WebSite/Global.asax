<%@ Application Language="C#" %>

<script runat="server">

    void Application_Start(object sender, EventArgs e)
    {
        // Code that runs on application startup
        Application["page_request"] = 0;
        Application["image"] = 0;

    }

    void Application_End(object sender, EventArgs e)
    {
        //  Code that runs on application shutdown

    }

    void Application_Error(object sender, EventArgs e)
    {

        // Code that runs when an unhandled error occurs
        /*  String str1 = "MyWebsite";
          string str2 = "http://localhost:53766/WebSite3/";
          System.Diagnostics.EventLog log = new System.Diagnostics.EventLog(str1);
          if (!System.Diagnostics.EventLog.SourceExists(str2))
          {
              System.Diagnostics.EventLog.CreateEventSource(str2, str1);
          }
          log.Source = str2;
          log.WriteEntry("Error :",System.Diagnostics.EventLogEntryType.Error);
          */
       // Response.Redirect("ErrorPage.aspx");
    }

    void Session_Start(object sender, EventArgs e)
    {
        // Code that runs when a new session is started
        Application["page_request"] = Convert.ToInt32(Application["page_request"]) + 1;
        Session["user_id"] =null;

    }

    void Session_End(object sender, EventArgs e)
    {

        // Code that runs when a session ends. 
        // Note: The Session_End event is raised only when the sessionstate mode
        // is set to InProc in the Web.config file. If session mode is set to StateServer 
        // or SQLServer, the event is not raised.

    }
       
</script>
