using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Xpo;

namespace WalshHospitality {
    public partial class Default : System.Web.UI.Page {

        protected void Page_Load(object sender, EventArgs e) {
            using (Session s = new Session()) {
                List<DbPage> pages = DbPage.Find(s, DbPage.PageCategory.Home);
                m_rpt.DataSource = pages;
                m_rpt.DataBind();
            }
        }

    }
}
