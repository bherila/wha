using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Xpo;

namespace WalshHospitality.admin {
    public partial class Pages : System.Web.UI.Page {

        protected Session m_session;


        protected void Page_Init(object sender, EventArgs e) {
            m_session = new Session();
            Dictionary<Guid, DbPage> pages = new Dictionary<Guid, DbPage>();
            XPCollection<DbPage> xpPages = new XPCollection<DbPage>(m_session);
            xpPages.Sorting.Add(new SortProperty("Oid", DevExpress.Xpo.DB.SortingDirection.Descending));
            foreach (DbPage pg in xpPages) {
                if (!pages.ContainsKey(pg.Guid))
                    pages.Add(pg.Guid, pg);
            }
            m_grid.DataSource = new List<DbPage>(pages.Values);
            m_grid.DataBind();
            m_grid.GroupBy(m_grid.Columns["Category"]);
            m_grid.ExpandAll();
        }

        protected override void Render(HtmlTextWriter writer) {
            m_session.Dispose();
            base.Render(writer);
        }


    }
}
