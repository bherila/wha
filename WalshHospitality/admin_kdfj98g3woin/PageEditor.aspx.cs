using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Xpo;
using Radactive.WebControls.ILoad;
using System.IO;
using System.Collections;
using System.Text.RegularExpressions;
using System.Web.UI.HtmlControls;

namespace WalshHospitality.admin {
    public partial class PageEditor : System.Web.UI.Page {

        protected Guid PageId {
            get {
                if (Request["id"] == null)
                    return Guid.Empty;
                else
                    return new Guid(Request["id"]);
            }
        }

        protected void Page_Load(object sender, EventArgs e) {
            this.initializeGreyBoxLibrary();
            useGreyBox(m_img1);
            useGreyBox(m_img2);
            useGreyBox(m_img3);
            useGreyBox(m_img4);
            useGreyBox(m_top.Top);
            useGreyBox(m_top.TopCenter);
            useGreyBox(m_top.TopRight);
            useGreyBox(m_top.TopLeft);
            useGreyBox(m_btmimage);

            if (!Page.IsPostBack) {
                if (string.IsNullOrEmpty(Request["id"]) || Request["id"] == "new") {
                    Guid newid = Guid.NewGuid();
                    using (Session s = new Session()) {
                        (new DbPage(s) { Guid = newid }).Save();
                    }
                    Response.Redirect("PageEditor.aspx?id=" + newid.ToString("N"));
                }
                else {
                    loadConfig(ref m_img2, ref m_img1);
                    loadConfig(ref m_img3, ref m_img1);
                    loadConfig(ref m_img4, ref m_img1);
                    loadData();
                }
            }
        }

        protected void loadData() {
            using (Session s = new Session()) {
                DbPage page = getPage(s);
                if (page == null)
                    throw new Exception("The page could not be found.");
                m_h1.Text = (string.IsNullOrEmpty(page.Heading1) ? string.Empty : page.Heading1);
                m_h2.Text = (string.IsNullOrEmpty(page.Heading2) ? string.Empty : page.Heading2);
                c.Content = (string.IsNullOrEmpty(page.HtmlContent) ? string.Empty : page.HtmlContent);
                m_sort.Text = page.SortOrder.ToString();

                m_client.Text = (string.IsNullOrEmpty(page.PropertyInfo.Client) ? string.Empty : page.PropertyInfo.Client);
                m_location.Text = (string.IsNullOrEmpty(page.PropertyInfo.Location) ? string.Empty : page.PropertyInfo.Location);
                m_propertyinfo.Text = (string.IsNullOrEmpty(page.PropertyInfo.Details) ? string.Empty : page.PropertyInfo.Details);
                m_scope.Text = (string.IsNullOrEmpty(page.PropertyInfo.Scope) ? string.Empty : page.PropertyInfo.Scope);

                m_img1.Value = getImage(page.ImgLeft1);
                m_img2.Value = getImage(page.ImgLeft2);
                m_img3.Value = getImage(page.ImgLeft3);
                m_img4.Value = getImage(page.ImgLeft4);
                m_top.Top.Value = getImage(page.ImgTop);
                m_top.TopLeft.Value = getImage(page.ImgTopLeft);
                m_top.TopCenter.Value = getImage(page.ImgTopCenter);
                m_top.TopRight.Value = getImage(page.ImgTopRight);
                m_top.ActiveTopMode = page.ImgTopMode;
                m_btmimage.Value = getImage(page.ImgBottom);

                m_category.Items.Clear();
                Array values = Enum.GetValues(typeof(DbPage.PageCategory));
                foreach (DbPage.PageCategory cat in values.Cast<DbPage.PageCategory>()) {
                    string name = cat.ToString();
                    string value = ((int)cat).ToString();
                    ListItem li = new ListItem(name, value);
                    li.Selected = (cat == page.Category);
                    m_category.Items.Add(li);
                }
            }
        }


        protected void saveData() {
            using (Session s = new Session()) {

                var newCategory = (DbPage.PageCategory)(int.Parse(m_category.SelectedValue));

                // update all previous revisions.....
                {
                    var x = from xpage in new XPQuery<DbPage>(s)
                            where xpage.Guid == PageId
                            select xpage;

                    foreach (DbPage oldpage in x) {
                        oldpage.Category = newCategory;
                        oldpage.Save();
                    }
                }

                // now make the new thing............
                using (DbPage oldPage = getPage(s))
                using (DbPage page = new DbPage(s)) {
                    page.Guid = oldPage.Guid;
                    page.Heading1 = m_h1.Text;
                    page.Heading2 = m_h2.Text;
                    page.HtmlContent = c.Content;

                    page.PropertyInfo = new PropertyInformation() {
                        Client = m_client.Text,
                        Location = m_location.Text,
                        Details = m_propertyinfo.Text,
                        Scope = m_scope.Text
                    };

                    page.ImgLeft1 = getImage(m_img1);
                    page.ImgLeft2 = getImage(m_img2);
                    page.ImgLeft3 = getImage(m_img3);
                    page.ImgLeft3 = getImage(m_img4);
                    page.ImgTopLeft = getImage(m_top.TopLeft);
                    page.ImgTopCenter = getImage(m_top.TopCenter);
                    page.ImgTopRight = getImage(m_top.TopRight);
                    page.ImgTop = getImage(m_top.Top);
                    page.ImgBottom = getImage(m_btmimage);
                    page.ImgTopMode = m_top.ActiveTopMode;

                    double sort = page.SortOrder;
                    double.TryParse(m_sort.Text, out sort);
                    page.SortOrder = sort;

                    page.Category = newCategory;
                    page.Save();
                }
            }
        }

        private static string importHtml(string SubjectString) {
            Match m = Regex.Match(SubjectString,
                "Client:\\s*(.*?)\\s*Location:\\s*(.*?)\\s*Property Information:\\s*(.*?)\\s*Scope:\\s*(.*?)\\s*\\z",
                RegexOptions.Singleline);
            if (m.Success) {

                List<string> lines = new List<string>(m.Groups[3].Value.Trim().Split('\r', '\n'));
                for (int i = lines.Count - 1; i >= 0; i--) {
                    if (string.IsNullOrEmpty(lines[i].Trim()))
                        lines.RemoveAt(i);
                }
                string propInfo = "<ul><li>" + string.Join("</li>\r\n<li>", lines.ToArray()) + "</li></ul>";

                return
                    "<h3>Client:<br/>\r\n"
                    + m.Groups[1].Value.Trim().Replace("\r\n", "<br/>")
                    + "</h3>\r\n\r\n<p><strong>Location:</strong><br/>\r\n"
                    + m.Groups[2].Value.Trim().Replace("\r\n", "<br/>")
                    + "</p>\r\n\r\n<p><strong>Property Information:</strong><br/>\r\n"
                    + propInfo
                    + "</p>\r\n\r\n<p><strong>Scope:</strong><br/>\r\n"
                    + m.Groups[4].Value.Trim()
                    + "</p>";
            }
            return SubjectString;
        }

        protected WebImage getImage(string name) {
            if (string.IsNullOrEmpty(name))
                return null;
            else {
                string[] pts = name.Split('*');
                try { return WebImage.Load(Server.MapPath(pts[0]), pts[1]); }
                catch { return null; }
            }
        }

        protected string getImage(ILoad control) {
            if (control.Value == null)
                return string.Empty;
            else {
                string root = Server.MapPath("/").TrimEnd('/', '\\');
                string fpath = control.Value.FolderPath.Replace(root, "").Replace('\\', '/');

                return fpath + "*" + control.Value.Id;
            }
        }


        protected static void loadConfig(ref ILoad dest, ref ILoad src) {
            dest.Configuration = src.Configuration.Clone();
        }

        protected DbPage getPage(Session s) {
            return DbPage.Find(s, PageId);
        }

        protected void DoSave(object sender, EventArgs e) {
            saveData();
        }

        protected void DoSaveAndExit(object sender, EventArgs e) {
            saveData();
            Response.Redirect(String.Format("Pages.aspx?uniqueId={0:N}", Guid.NewGuid()));
        }

        protected void DoDelete(object sender, EventArgs e) {
            saveData();
            Response.Redirect(String.Format("PageDelete.aspx?id={0:N}", PageId));
        }


        protected string VSCacheKey {
            get { return "CKKEY_" + PageId.ToString("N"); }
        }

        protected override object LoadPageStateFromPersistenceMedium() {
            object viewStateBag;
            string m_viewState = (string)Session[VSCacheKey];
            LosFormatter m_formatter = new LosFormatter();
            try {
                viewStateBag = m_formatter.Deserialize(m_viewState);
            }
            catch {
                throw new HttpException("The View State is invalid.");
            }
            return viewStateBag;
        }
        protected override void SavePageStateToPersistenceMedium(object viewState) {
            using (MemoryStream ms = new MemoryStream()) {
                LosFormatter m_formatter = new LosFormatter();
                m_formatter.Serialize(ms, viewState);
                ms.Position = 0;
                using (StreamReader sr = new StreamReader(ms)) {
                    string viewStateString = sr.ReadToEnd();
                    Session[VSCacheKey] = viewStateString;
                    sr.Close();
                }
                ms.Close();
            }
            return;
        }

        protected void useGreyBox(ILoad loader) {
            loader.CustomWindowProvider_Open = "CustomWindowProvider_WindowOpen";
            loader.CustomWindowProvider_Close = "CustomWindowProvider_WindowClose";
            loader.WindowMode = Radactive.WebControls.ILoad.Configuration.ILoadWindowMode.Custom;
        }


        protected void initializeGreyBoxLibrary() {
            // Add the GreyBox scripts to the page...

            HtmlGenericControl js = new HtmlGenericControl("script");
            js.Attributes["type"] = "text/javascript";
            js.InnerHtml = "\r\n//<![CDATA[\r\nvar GB_ROOT_DIR = \"" + base.ResolveUrl("~/GreyBox/greybox/") + "\";\r\n//]]>\r\n";
            this.Page.Header.Controls.Add(js);

            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append("<!-- Initialize GreyBox library -->\r\n");
            sb.Append("<script src=\"" + base.ResolveUrl("~/GreyBox/greybox/AJS.js") + "\" type=\"text/javascript\"></script>\r\n");
            sb.Append("<script src=\"" + base.ResolveUrl("~/GreyBox/greybox/AJS_fx.js") + "\" type=\"text/javascript\"></script>\r\n");
            sb.Append("<script src=\"" + base.ResolveUrl("~/GreyBox/greybox/gb_scripts.js") + "\" type=\"text/javascript\"></script>\r\n");
            sb.Append("<link media=\"all\" href=\"" + base.ResolveUrl("~/GreyBox/greybox/gb_styles.css") + "\" type=\"text/css\" rel=\"stylesheet\" />\r\n");
            sb.Append("<!-- End Initialize GreyBox library -->\r\n");
            sb.Append("\r\n");

            LiteralControl js2 = new LiteralControl();
            js2.Text = "\r\n" + sb.ToString() + "\r\n";
            base.Page.Header.Controls.Add(js2);
        }

    }
}
