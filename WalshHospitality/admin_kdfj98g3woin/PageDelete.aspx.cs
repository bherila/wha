using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Xpo;
using DevExpress.Data.Filtering;

namespace WalshHospitality.admin {
    public partial class PageDelete : System.Web.UI.Page {

        protected Guid PageId {
            get {
                if (Request["id"] == null)
                    return Guid.Empty;
                else
                    return new Guid(Request["id"]);
            }
        }

        protected void DoCancel(object sender, EventArgs e) {
            Response.Redirect(String.Format("PageEditor.aspx?id={0}", PageId));
        }

        protected void DoConfirmDelete(object sender, EventArgs e) {
            using (Session s = new Session()) {
                XPCollection<DbPage> pages = new XPCollection<DbPage>(s);
                pages.Criteria = new BinaryOperator("Guid", PageId);
                for (int i = 0; i < pages.Count; i++) {
                    pages[i].Delete();
                }
            }
            Response.Redirect(String.Format("Pages.aspx?guid={0}", Guid.NewGuid()));
        }

        protected void Page_Init(object sender, EventArgs e) {
            Response.Expires = -1;
            Response.Cache.SetNoServerCaching();
            Response.Cache.SetNoStore();
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
        }

    }
}
