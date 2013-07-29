using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Xpo;
using System.IO;

namespace WalshHospitality.admin {
    public partial class Cleanup : System.Web.UI.Page {

        protected int DbItem_RevisionsToSave {
            get{ return 10; }
        }

        protected void Page_Load(object sender, EventArgs e) {
            List<string> all_files = getAllFiles();
            List<string> used_files = getUsedFiles();
            //all_files.ForEach(x => {
            //    Response.Write(x + "<br/>");
            //});
            //Response.Write("<hr>");
            //used_files.ForEach(x => {
            //    Response.Write(x + "<br/>");
            //});

            List<string> files_to_remove = new List<string>(all_files);
            used_files.ForEach(x => { files_to_remove.Remove(x); });

            files_to_remove = resolveFilenames(files_to_remove);
            files_to_remove.ForEach(x => {
                Response.Write(x + "<br/>");
            });

        }

        protected List<string> resolveFilenames(List<string> srcFiles) {
            List<string> result = new List<string>(srcFiles.Count);
            string[] dir = Directory.GetFiles(Server.MapPath("/images"));
            srcFiles.ForEach(x => {
                for (int i = 0; i < dir.Length; i++) {
                    string fID = Path.GetFileNameWithoutExtension(dir[i]).Split('_')[0].ToLower();
                    if (x == fID) {
                        result.Add(dir[i]);
                    }
                }
            });
            return result;
        }

        protected List<string> getAllFiles() {
            List<string> leftoverFiles = new List<string>();
            string rootPath = Server.MapPath("/images");
            Array.ForEach<string>(Directory.GetFiles(rootPath), x => {
                string fID = Path.GetFileNameWithoutExtension(x).Split('_')[0].ToLower();
                if (!leftoverFiles.Contains(fID))
                    leftoverFiles.Add(fID);
            });
            return leftoverFiles;
        }

        protected List<string> getUsedFiles() {
            List<string> pageFiles = new List<string>();
            using (Session s = new Session()) {
                XPCollection<DbPage> allPages = new XPCollection<DbPage>(s);
                foreach (DbPage page in allPages) {
                    pageFiles.Add(getStr(page.ImgLeft1));
                    pageFiles.Add(getStr(page.ImgLeft2));
                    pageFiles.Add(getStr(page.ImgLeft3));
                    pageFiles.Add(getStr(page.ImgLeft4));
                    pageFiles.Add(getStr(page.ImgTop));
                }
            }
            List<string> files = new List<string>();
            pageFiles.ForEach(x => {
                string[] xx = x.Split('*');
                if (xx.Length == 2) {
                    string xxx = xx[1].ToLower();
                    if (!files.Contains(xxx))
                        files.Add(xxx);
                }
            });
            return files;

        }

        protected static string getStr(string x) {
            if (x == null) 
                return string.Empty;
            else 
                return x;
        }

    }
}
