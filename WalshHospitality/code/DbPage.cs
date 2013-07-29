using System;
using DevExpress.Xpo;
using DevExpress.Data.Filtering;
using DevExpress.Xpo.Metadata;
using System.Collections.Generic;

namespace WalshHospitality {

    public struct PropertyInformation {

        [Size(255)]
        public string Client;

        [Size(512)]
        public string Location;

        [Size(4096)]
        public string Details;

        [Size(4096)]
        public string Scope;

    }

    public enum TopMode { OneImage = 0, ThreeImages = 1 }

    public class DbPage : XPObject, IComparable<DbPage>, IDisposable {
        public DbPage()
            : base() {
            // This constructor is used when an object is loaded from a persistent storage.
            // Do not place any code here.
        }

        public DbPage(Session session)
            : base(session) {
            // This constructor is used when an object is loaded from a persistent storage.
            // Do not place any code here.
        }

        protected DbPage(Session session, DevExpress.Xpo.Metadata.XPClassInfo classInfo)
            : base(session, classInfo) {

        }


        public override void AfterConstruction() {
            base.AfterConstruction();
            // Place here your initialization code.
        }

        private Guid _Guid;
        [Indexed(Unique = false), ValueConverter(typeof(GuidValueConverter))]
        public Guid Guid {
            get { return _Guid; }
            set { SetPropertyValue("Guid", ref _Guid, value); }
        }

        public static DbPage Find(Session session, Guid guid) {
            XPCollection<DbPage> c = new XPCollection<DbPage>(session) {
                TopReturnedObjects = 1,
                Criteria = new BinaryOperator("Guid", guid)
            };
            c.Sorting.Add(new SortProperty("Oid", DevExpress.Xpo.DB.SortingDirection.Descending));
            if (c.Count == 0)
                return null;
            else
                return c[0];
        }

        public static List<DbPage> Find(Session s, PageCategory category) {
            Dictionary<Guid, DbPage> d_pages = new Dictionary<Guid, DbPage>();
            XPCollection<DbPage> pages = new XPCollection<DbPage>(s);
            pages.Sorting.Add(new SortProperty("Oid", DevExpress.Xpo.DB.SortingDirection.Descending));
            //pages.Criteria = new BinaryOperator("Category", category);
            List<DbPage> pageList = new List<DbPage>(pages);
            foreach (DbPage p in pageList) {
                if (p.Category == category) {
                    if (!d_pages.ContainsKey(p.Guid))
                        d_pages.Add(p.Guid, p);
                }
            }
            if (pages.Count == 0) {
                //throw new Exception("fail" + pages.Criteria.ToString());
            }
            List<DbPage> lst_pages = new List<DbPage>(d_pages.Values);
            lst_pages.Sort();
            return lst_pages;
        }

        public enum PageCategory {
            None = 0, AboutUs = 1, Services = 2, Projects = 4, Home = 8, Team = 16
        }

        private PageCategory _Category;
        public PageCategory Category {
            get { return _Category; }
            set { SetPropertyValue("Category", ref _Category, value); }
        }

        private string _Heading1;
        [Size(255)]
        public string Heading1 {
            get {
                return _Heading1;
            }
            set {
                SetPropertyValue("Heading1", ref _Heading1, value);
            }
        }

        private string _Heading2;
        [Size(255)]
        public string Heading2 {
            get {
                return _Heading2;
            }
            set {
                SetPropertyValue("Heading2", ref _Heading2, value);
            }
        }

        private string _ImgTop;
        [Size(255)]
        public string ImgTop {
            get {
                return _ImgTop;
            }
            set {
                SetPropertyValue("ImgTop", ref _ImgTop, value);
            }
        }

        private string _ImgTopLeft;
        public string ImgTopLeft {
            get { return _ImgTopLeft; }
            set { SetPropertyValue("ImgTopLeft", ref _ImgTopLeft, value); }
        }

        private string _ImgTopCenter;
        public string ImgTopCenter {
            get { return _ImgTopCenter; }
            set { SetPropertyValue("ImgTopCenter", ref _ImgTopCenter, value); }
        }

        private string _ImgTopRight;
        public string ImgTopRight {
            get { return _ImgTopRight; }
            set { SetPropertyValue("ImgTopRight", ref _ImgTopRight, value); }
        }

        private TopMode _ImgTopMode = TopMode.OneImage;
        public TopMode ImgTopMode {
            get {return _ImgTopMode;}
            set {SetPropertyValue("ImgTopMode", ref _ImgTopMode, value);}
        }

        private string _ImgLeft1;
        [Size(255)]
        public string ImgLeft1 {
            get {
                return _ImgLeft1;
            }
            set {
                SetPropertyValue("ImgLeft1", ref _ImgLeft1, value);
            }
        }

        private string _ImgLeft2;
        [Size(255)]
        public string ImgLeft2 {
            get {
                return _ImgLeft2;
            }
            set {
                SetPropertyValue("ImgLeft2", ref _ImgLeft2, value);
            }
        }

        private string _ImgLeft3;
        [Size(255)]
        public string ImgLeft3 {
            get {
                return _ImgLeft3;
            }
            set {
                SetPropertyValue("ImgLeft3", ref _ImgLeft3, value);
            }
        }

        private string _ImgLeft4;
        [Size(255)]
        public string ImgLeft4 {
            get {
                return _ImgLeft4;
            }
            set {
                SetPropertyValue("ImgLeft4", ref _ImgLeft4, value);
            }
        }

        private string _ImgBottom;
        [Size(255)]
        public string ImgBottom {
            get {
                return _ImgBottom;
            }
            set {
                SetPropertyValue("ImgBottom", ref _ImgBottom, value);
            }
        }

        private string _HtmlContent;
        [Size(20000)]
        public string HtmlContent {
            get {
                return _HtmlContent;
            }
            set {
                SetPropertyValue("HtmlContent", ref _HtmlContent, value);
            }
        }

        private double _SortOrder;
        public double SortOrder {
            get {
                return _SortOrder;
            }
            set {
                SetPropertyValue("SortOrder", ref _SortOrder, value);
            }
        }

        public string DisplayName {
            get {
                if (!string.IsNullOrEmpty(Heading2))
                    return Heading2;
                if (!string.IsNullOrEmpty(Heading1))
                    return Heading1;
                else
                    return Guid.ToString();
            }

        }

        private PropertyInformation _PropertyInfo;
        [Persistent()]
        public PropertyInformation PropertyInfo {
            get {
                return _PropertyInfo;
            }
            set {
                SetPropertyValue("PropertyInfo", ref _PropertyInfo, value);
            }
        }


        #region IComparable<DbPage> Members

        public int CompareTo(DbPage other) {
            return (int)(1000000.0 * (this.SortOrder - other.SortOrder));
        }

        #endregion

        public void Dispose() {
            throw new NotImplementedException();
        }
    }
}