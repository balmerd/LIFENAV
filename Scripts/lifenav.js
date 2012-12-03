var YDOM = YAHOO.util.Dom;
var YEVENT = YAHOO.util.Event;
var YCOOKIE = YAHOO.util.Cookie;

YAHOO.namespace("LifeNavigator");

YAHOO.LifeNavigator.Util = function () {
	return {
		logError: function(source, ex) {
			alert("EXCEPTION : YAHOO.LifeNavigator."+source+" : "+ex.description);
		},
		logDebug: function(source, msg) {
			alert("DEBUG : YAHOO.LifeNavigator."+source+" : "+msg);
		}
	};
}();

YAHOO.LifeNavigator.Cookie = function () { // http://yuiblog.com/blog/2007/06/12/module-pattern/
	// private variables
	//var cookieValue;
	var cookieName = "LifeNavigator";
	//private method:
	//var privateMethod = function () {
	//	// we can use private variables without using this
	//};
	return { // returned object will become LifeNavigator.Cookie
		// public properties
		value: null, // will contain the object returned by getSubs()
		version: "1.0", // access from inside public methods using "this"
		// public methods
		test: function() {
			alert(cookieName+":"+this.version);
			
		},
		dump: function() {
			var cookie = this.getSubs();
			var props = "";
			for (property in cookie) {
				props += (property+"="+cookie[property]+"\n");
			}
			alert(props == "" ? "no properties" : props);
		},
		getSubs: function() {
			// get all subcookie values
			return YCOOKIE.getSubs(cookieName);
		},
		getSub: function(name) {
			// get single subcookie value
			return YCOOKIE.getSub(cookieName, name);
		},
		getSubs: function() {
			// get all subcookie values
			return YCOOKIE.getSubs(cookieName);
		},
		setSub: function(name, value) {
			// update single subcookie value
			YCOOKIE.setSub(cookieName, name, value, { expires: new Date("January 1, 2050") });
			this.value = this.getSubs();
		},
		setSubs: function(obj) {
			// update selected subcookie values
			try {
				if (obj) {
					for (property in obj) { // add or update properties
						this.value[property] = obj[property];
					}
					// replace cookie with updated subcookie values
					YCOOKIE.setSubs(cookieName, this.value);
				} else {
					YAHOO.LifeNavigator.Util.logDebug("Cookie.setSubs", "obj is null");
				}
			} catch (ex) {
				YAHOO.LifeNavigator.Util.logError("Cookie.setSubs", ex);
			}
			
			
		},
		init: function() {
			try {
				this.value = this.getSubs(); // get current value
				if (!this.value) { // create new cookie
					this.setSub("ClientId", "");
				}
			} catch (ex) {
				YAHOO.LifeNavigator.Util.logError("Cookie.init", ex);
			}
		}
	};
}();
//}().init(); // works, but doesn't create a YAHOO.LifeNavigator.Cookie object
//YAHOO.LifeNavigator.Cookie.init(); // inside method, "this" is YAHOO.LifeNavigator.Cookie
//YAHOO.util.Event.onDOMReady(YAHOO.LifeNavigator.Cookie.init); // inside method, "this" is window object
YEVENT.onDOMReady(YAHOO.LifeNavigator.Cookie.init, null, YAHOO.LifeNavigator.Cookie); // inside method, "this is YAHOO.LifeNavigator.Cookie
