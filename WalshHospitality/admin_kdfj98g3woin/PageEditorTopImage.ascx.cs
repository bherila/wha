using System;
using Radactive.WebControls.ILoad;

namespace WalshHospitality {
    public partial class PageEditorTopImage : System.Web.UI.UserControl {

        public ILoad TopLeft { get { return m_imgTopLeft; } }
        public ILoad TopRight { get { return m_imgTopRight; } }
        public ILoad TopCenter { get { return m_imgTopCenter; } }
        public ILoad Top { get { return m_topimg; } }

        public int ActiveTabIndex {
            get { return t.ActiveTabIndex; }
            set { t.ActiveTabIndex = value; }
        }

        public TopMode ActiveTopMode {
            get { return (TopMode)ActiveTabIndex; }
            set { ActiveTabIndex = (int)value; }
        }

    }
}