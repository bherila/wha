<%@ Application Language="C#" %>
<%@ Import Namespace="System.Web" %>
<%@ Import Namespace="DevExpress.Xpo" %>
<script RunAt="server">

    void Application_Start(object sender, EventArgs e) {
        // Code that runs on the application startup
        // Specify the connection string, which is used to open a database. 
        // It's supposed that you've already created the Comments database within the App_Data folder.
        string conn;

        //if (Context.Request.Url.Host.ToLower() == "localhost" || Context.Request.Url.Host.ToLower() == "127.0.0.1") {
        //    conn = DevExpress.Xpo.DB.MySqlConnectionProvider.GetConnectionString("localhost", "root", "eggbert", "walsh_hotels");
        //}
        //else {
        //    conn = DevExpress.Xpo.DB.MySqlConnectionProvider.GetConnectionString("localhost", "walsh_hotels", "horan6", "walsh_hotels");
        //}

        //conn = DevExpress.Xpo.DB.MSSqlConnectionProvider.GetConnectionString("67.222.136.138", "whs", "horan6", "whs");
        conn = DevExpress.Xpo.DB.SQLiteConnectionProvider.GetConnectionString(Server.MapPath("/App_Data/walsh_hospitality.db"));
        
        DevExpress.Xpo.Metadata.XPDictionary dict = new DevExpress.Xpo.Metadata.ReflectionDictionary();
        // Initialize the XPO dictionary.
        dict.GetDataStoreSchema(typeof(WalshHospitality.Default).Assembly);
        DevExpress.Xpo.XpoDefault.Session = null;
        DevExpress.Xpo.DB.IDataStore store = DevExpress.Xpo.XpoDefault.GetConnectionProvider(conn, DevExpress.Xpo.DB.AutoCreateOption.DatabaseAndSchema);
        DevExpress.Xpo.XpoDefault.DataLayer = new DevExpress.Xpo.ThreadSafeDataLayer(dict, store);
        DevExpress.Xpo.XpoDefault.Session = new DevExpress.Xpo.Session();
        DevExpress.Xpo.XpoDefault.Session.UpdateSchema();
    }

    protected void Session_Start(object sender, EventArgs e) {

    }

    protected void Application_BeginRequest(object sender, EventArgs e) {
        Response.Buffer = true;
    }

    protected void Application_AuthenticateRequest(object sender, EventArgs e) {

    }

    protected void Application_Error(object sender, EventArgs e) {

    }

    protected void Session_End(object sender, EventArgs e) {

    }

    protected void Application_End(object sender, EventArgs e) {

    }
</script>

