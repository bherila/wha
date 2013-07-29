using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.IO;
using System.Collections.Generic;
using DevExpress.Xpo;
using DevExpress.Data.Filtering;

namespace Walsh {
    public partial class Template : System.Web.UI.MasterPage {

        //protected Session m_session;

        //protected void Page_Init(object sender, EventArgs e) {
        //    m_session = new Session();
        //}

        //protected void Page_Unload(object sender, EventArgs e) {
        //    if (m_session != null) {
        //        m_session.Dispose();
        //    }
        //}


        protected void Page_Load(object sender, EventArgs e) {

            if (string.IsNullOrEmpty(Page.Title) || Page.Title == "Untitled Page")
                Page.Title = "Walsh Hospitality Advisors";
            else
                Page.Title += " - Walsh Hospitality Advisors";

            //string thumbs = Server.MapPath("/thumbs/thumbs.db");
            //if (File.Exists(thumbs))
            //    File.Delete(thumbs);

            //TODO: this isn't very efficient.
            //const int num_items = 5;
            //using (Session xpoSession = new Session()) {
            //    using (XPCollection<XpoRotation> rot = new XPCollection<XpoRotation>(xpoSession)) {
            //        rot.Criteria = new GroupOperator(GroupOperatorType.And,
            //            new BinaryOperator("Enabled", true),
            //            new BinaryOperator("RotationType", 0));
            //        rot.Load();
            //        Random r = new Random();
            //        List<XpoRotation> tmp = new List<XpoRotation>(rot);
            //        List<XpoRotation> dst = new List<XpoRotation>(num_items);
            //        while (dst.Count < num_items && tmp.Count > 0) {
            //            int index = r.Next(tmp.Count);
            //            dst.Add(tmp[index]);
            //            tmp.RemoveAt(index);
            //        }
            //        m_rotation.DataSource = dst;
            //        m_rotation.DataBind();
            //    }
            //}

        }



    }
}
