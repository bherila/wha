using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Xpo;
using DevExpress.Data.Filtering;
using System.Xml;
using System.Web.UI.HtmlControls;

namespace WalshHospitality {
    public partial class Page : System.Web.UI.Page {

        protected Guid req_id {
            get {
                if (Request["id"] == null)
                    return Guid.Empty;
                else
                    return new Guid(Request["id"]);
            }
        }

        protected void Page_Init(object sender, EventArgs e) {
            using (Session s = new Session()) {
                Title = string.Empty;
                DbPage page = DbPage.Find(s, req_id);
                if (page == null) {
                    //Response.StatusCode = 404;
                    Response.Write("Page not found.");
                    Response.End();
                    return;
                }

                // heading 2 **********************************
                if (string.IsNullOrEmpty(page.Heading2))
                    m_ph_h2.Visible = false;
                else
                    Title = m_h2.Text = page.Heading2.Replace("|", "<br/>");

                // heading 1 **********************************
                if (string.IsNullOrEmpty(page.Heading1)) {
                    m_ph_h1.Visible = false;
                }
                else {
                    Title = m_h1.Text = page.Heading1;
                }

                // left img ***********************************
                string suffix = "_LeftCol.jpg";
                doImage(ref m_ph_leftcol, page.ImgLeft1, suffix);
                doImage(ref m_ph_leftcol, page.ImgLeft2, suffix);
                doImage(ref m_ph_leftcol, page.ImgLeft3, suffix);
                doImage(ref m_ph_leftcol, page.ImgLeft4, suffix);

                // top img ************************************
                if (page.ImgTopMode == TopMode.OneImage) {
                    doImage(ref m_ph_topimage, page.ImgTop, "_TopImage.jpg");
                }
                else {
                    doThreeImagesOnTop(ref page);
                }

                // btm img ************************************
                doImage(ref m_ph_btmimage, page.ImgBottom, "_BtmImage.jpg");

                // content ************************************
                if (!string.IsNullOrEmpty(page.HtmlContent))
                    m_content.Text = page.HtmlContent;

                // builtin content ****************************
                if (!string.IsNullOrEmpty(page.PropertyInfo.Scope))
                    m_content.Text = "<p><span class=\"label\">Scope:</span></p><ul style=\"margin-top: -1em;\"><li>"
                        + Server.HtmlEncode(page.PropertyInfo.Scope).Trim("[-] ".ToCharArray()).Replace("[-]", "</li><li>")
                        + "</li></ul>" + m_content.Text;

                if (!string.IsNullOrEmpty(page.PropertyInfo.Details))
                    m_content.Text = "<p><span class=\"label\">Details:</span></p><ul style=\"margin-top: -1em;\"><li>"
                        + Server.HtmlEncode(page.PropertyInfo.Details).Trim("[-] ".ToCharArray()).Replace("[-]", "</li><li>")
                        + "</li></ul>" + m_content.Text;

                if (!string.IsNullOrEmpty(page.PropertyInfo.Location))
                    m_content.Text = "<p><span class=\"label\">Location:</span><div style=\"line-height: 100%;\">" + Server.HtmlEncode(page.PropertyInfo.Location).Replace("\n", "<br/>") + "</div></p>" + m_content.Text;

                if (!string.IsNullOrEmpty(page.PropertyInfo.Client))
                    m_content.Text = "<h3>Client:<br/>" + Server.HtmlEncode(page.PropertyInfo.Client) + "</h3>" + m_content.Text;

                m_catname.Text = System.Text.RegularExpressions.Regex.Replace(page.Category.ToString(), "([A-Z])", " $1");
                m_ph_content.Visible = !string.IsNullOrEmpty(m_content.Text);

                // rtmenu *************************************
                DbPage.Find(s, page.Category).ForEach(p => {
                    m_rtmenu.Items.Add(new DevExpress.Web.ASPxMenu.MenuItem {
                        Text = p.DisplayName.Split('|')[0],
                        NavigateUrl = "Page.aspx?id=" + p.Guid.ToString()
                    });
                });
                m_rtmenu.Visible = (m_rtmenu.Items.Count > 1);
            }
        }

        private void doThreeImagesOnTop(ref DbPage page) {
            if (page.ImgTopCenter == null && page.ImgTopLeft == null && page.ImgTopRight == null)
                return;

            HtmlGenericControl table = new HtmlGenericControl("table");
            table.Attributes.Add("border", "0");
            table.Attributes.Add("cellpadding", "0");
            table.Attributes.Add("cellspacing", "0");
            table.Attributes.Add("style", "width:100%;");
            HtmlGenericControl row = new HtmlGenericControl("tr");
            HtmlGenericControl p1 = new HtmlGenericControl("td");
            HtmlGenericControl p2 = new HtmlGenericControl("td");
            HtmlGenericControl p3 = new HtmlGenericControl("td");
            p2.Attributes.Add("style", "text-align: center;");
            row.Controls.Add(p1);
            row.Controls.Add(p2);
            row.Controls.Add(p3);

            doImage(ref p1, page.ImgTopLeft, "_TopImage.jpg");
            doImage(ref p2, page.ImgTopCenter, "_TopImage.jpg");
            doImage(ref p3, page.ImgTopRight, "_TopImage.jpg");

            table.Controls.Add(row);
            m_ph_topimage.Controls.Add(table);
        }

        protected static void doImage(ref HtmlGenericControl ph, string url, string suffix) {
            if (!string.IsNullOrEmpty(url)) {
                ph.Controls.Add(new Literal() { Text = "<div>" });
                ph.Controls.Add(new Image() { ImageUrl = url.Replace('*', '/') + suffix, GenerateEmptyAlternateText = true, CssClass = "leftimg" });
                ph.Controls.Add(new Literal() { Text = "</div>" });
            }
        }

    }
}
