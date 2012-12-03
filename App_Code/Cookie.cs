using System;
using System.Data;
using System.Collections.Specialized;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

namespace LifeNavigator.Web
{
    public abstract class CookieBase
    {
        protected HttpCookie cookie;

		public bool IsAvailableInRequest = false;

        public virtual void ClearCookie() { }

        public string Content {
            get { return cookie.Value; }
            set { cookie.Value = value; }
        }
        public DateTime Expires {
            get { return cookie.Expires; }
            set { cookie.Expires = value; }
        }
        public string Path {
            get { return cookie.Path; }
            set { cookie.Path = value; }
        }
        public string Domain {
            get { return cookie.Domain; }
            set { cookie.Domain = value; }
        }
        public bool HttpOnly {
            get { return cookie.HttpOnly; }
            set { cookie.HttpOnly = value; }
        }

		protected CookieBase(string name, HttpCookieCollection col)
        {
            HttpCookie ck = null;
            if (col != null) {
                for (int i = 0; i < col.Count; i++) {
                    // HACK?  For whatever reason, there are two cookies sent back in IE7:
                    // One is blank, and the other one has contents.  Let's read the non-blank one.
                    if ((col[i].Name == name) && (col[i].Value.Length > 0)) {
                        ck = col[i];
                        break;
                    }
                }
            }

            if (ck == null) {
                //cookie not found, create a default cookie for use
                cookie = new HttpCookie(name);
            } else {
				cookie = ck;
				IsAvailableInRequest = true;
			}
        }

        public void Persist(HttpResponse response)
        {
            cookie.Expires = DateTime.Now.AddDays(90);
			if (IsAvailableInRequest) {
				response.Cookies.Set(cookie);
			} else {
				response.Cookies.Add(cookie);
			}
        }
    }

    public class LifeNavCookie : CookieBase
    {
		public string ClientId {
			get { return cookie["ClientId"]; }
			set { cookie["ClientId"] = value; }
		}
		public string EmailAddress {
			get { return HttpUtility.UrlDecode(cookie["Email"]); }
			set { cookie["Email"] = value; }
		}
		public string AppointmentDate {
			get { return HttpUtility.UrlDecode(cookie["Date"]); }
			set { cookie["Date"] = value; }
		}
		public string AppointmentTime {
			get { return cookie["Time"]; }
			set { cookie["Time"] = value; }
		}
		public string AppointmentType {
			get { return cookie["Type"]; }
			set { cookie["Type"] = value; }
		}
		public string GroupSize {
			get { return cookie["GroupSize"]; }
			set { cookie["GroupSize"] = value; }
		}
		public bool HasClientId {
			get {
				return !String.IsNullOrEmpty(ClientId);
			}
		}

		public LifeNavCookie(HttpCookieCollection ck) : base("LifeNavigator", ck) { }

        public override void ClearCookie()
        {
			this.ClientId = "";
			this.EmailAddress = "";
			this.AppointmentDate = "";
			this.AppointmentTime = "";
			this.AppointmentDate = "";
			this.AppointmentType = "";
			this.GroupSize = "";
        }
    }
}