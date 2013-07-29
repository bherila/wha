<%@ Control Language="C#" AutoEventWireup="true" EnableViewState="false" %>
<%@ Import Namespace="DevExpress.Xpo" %>
<%@ Register assembly="DevExpress.Web.v10.2, Version=10.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxMenu" tagprefix="dxm" %>
<script runat="server">
    protected void Page_Load(object sender, EventArgs e) {
        using (Session s = new Session()) {

            // about us ***************************
            try {
                menu.Items[1].NavigateUrl = "~/Page.aspx?id=" +
                    WalshHospitality.DbPage.Find(s, WalshHospitality.DbPage.PageCategory.AboutUs)[0].Guid.ToString();
            }
            catch { menu.Items[1].NavigateUrl = ""; }
            
            // service pages **********************
                WalshHospitality.DbPage.Find(s, WalshHospitality.DbPage.PageCategory.Services).ForEach(p => {
                    menu.Items[2].Items.Add(new DevExpress.Web.ASPxMenu.MenuItem() {
                        NavigateUrl = "~/Page.aspx?id=" + p.Guid.ToString(),
                        Text = p.DisplayName
                    });
                });
                menu.Items[2].NavigateUrl = menu.Items[2].Items[0].NavigateUrl; // default url

            // project pages **********************
                WalshHospitality.DbPage.Find(s, WalshHospitality.DbPage.PageCategory.Projects).ForEach(p => {
                    menu.Items[3].Items.Add(new DevExpress.Web.ASPxMenu.MenuItem() {
                        NavigateUrl = "~/Page.aspx?id=" + p.Guid.ToString(),
                        Text = p.DisplayName
                    });
                });
                menu.Items[3].NavigateUrl = menu.Items[3].Items[0].NavigateUrl; // default url
            
            // contact us *************************
            WalshHospitality.DbPage about_us = null;
            foreach (WalshHospitality.DbPage pp in WalshHospitality.DbPage.Find(s, WalshHospitality.DbPage.PageCategory.AboutUs)) {
                if (!string.IsNullOrEmpty(pp.Heading1) && pp.Heading1.Contains("Contact")) {
                    about_us = pp;
                    break;
                }
            }
            if (about_us != null)
                menu.Items[5].NavigateUrl = "~/Page.aspx?id=" + about_us.Guid.ToString();
            else {
                Response.Write("<scri"+"pt>alert('No page with heading 1 like %contact% found in AboutUs category');</scr"+"ipt>");
            }

            // our team ***************************
            WalshHospitality.DbPage our_team = null;
            foreach (WalshHospitality.DbPage pp in WalshHospitality.DbPage.Find(s, WalshHospitality.DbPage.PageCategory.Team)) {
                if (!string.IsNullOrEmpty(pp.Heading1) && pp.Heading1.Contains("Team")) {
                    our_team = pp;
                    break;
                }
            }
            if (our_team != null)
                menu.Items[4].NavigateUrl = "~/Page.aspx?id=" + our_team.Guid.ToString();
            else {
                Response.Write("<scri" + "pt>alert('No page with heading 1 like %team% found in AboutUs category');</scr" + "ipt>");
            }
            
           
        }
    }
</script>
<table border="0" cellpadding="0" cellspacing="0" class="topNavBar">
<tr><td style="text-align: left;">
<dxm:aspxmenu ID="menu" runat="server" BackColor="#355E3B" ItemSpacing="10px"  
                RenderIFrameForPopupElements="False" Font-Bold="True" Font-Names="Arial" 
                Font-Size="8pt" AppearAfter="0" SyncSelectionMode="CurrentPathAndQuery">
    <Border BorderStyle="None" />
    <SubMenuStyle GutterColor="#C6D5C7" />
    <SubMenuItemStyle Font-Bold="False">
    </SubMenuItemStyle>
    <Items>
        <dxm:menuitem NavigateUrl="~/Default.aspx" Text="HOME">
        </dxm:MenuItem>
        <dxm:menuitem NavigateUrl="~/page-about.asmx" Text="ABOUT US">
        </dxm:MenuItem>
        <dxm:menuitem Text="SERVICES" NavigateUrl="javascript:void(0);" />
        <dxm:menuitem Text="PROJECTS" NavigateUrl="javascript:void(0);" />
        <%--<dxm:MenuItem Text="CLIENTS" NavigateUrl="~/page-clients.asmx" />--%>
        <dxm:menuitem Text="OUR TEAM" NavigateUrl="~/page-team.asmx" />
        <dxm:menuitem Text="CONTACT US" NavigateUrl="~/page-contact.asmx" />
    </Items>
    <ItemStyle BackColor="#355E3B" ForeColor="White" HoverStyle-BackColor="#678D6B">
<HoverStyle BackColor="#678D6B"></HoverStyle>

    <Paddings Padding="5px" />
    <Border BorderStyle="None" />
            </ItemStyle>
</dxm:aspxmenu>

</td></tr>
</table>