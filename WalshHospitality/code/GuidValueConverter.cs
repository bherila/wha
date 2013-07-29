using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DevExpress.Xpo.Metadata;

namespace WalshHospitality
{
    public class GuidValueConverter : ValueConverter
    {
        public override object ConvertFromStorageType(object value) {
            return Guid.Parse(value.ToString());
        }

        public override object ConvertToStorageType(object value) {
            return ((Guid)value).ToString("N").ToUpper();
        }

        public override Type StorageType {
            get { return typeof(String); }
        }
    }
}