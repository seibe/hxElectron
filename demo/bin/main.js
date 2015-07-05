(function (console) { "use strict";
var Main = function() {
	var _g = this;
	var template = [electron__$MenuItem_MenuItem_$Impl_$.fromDynamic({ label : "View", submenu : [{ label : "Reload", accelerator : "Ctrl+R", click : function() {
		electron_BrowserWindow.getFocusedWindow().reloadIgnoringCache();
	}},{ label : "Toggle DevTools", accelerator : "Alt+Ctrl+I", click : function() {
		electron_BrowserWindow.getFocusedWindow().toggleDevTools();
	}}]})];
	var menu = electron_Menu.buildFromTemplate(template);
	electron_App.on("window-all-closed",function() {
		electron_App.quit();
	});
	electron_App.on("ready",function() {
		_g.openWindow("0");
		electron_Menu.setApplicationMenu(menu);
	});
};
Main.main = function() {
	new Main();
};
Main.prototype = {
	openWindow: function(baseDir) {
		var win = new electron_BrowserWindow({ width : 800, height : 600});
		win.loadUrl("file://" + __dirname + "/index.html?baseDir=" + encodeURIComponent(baseDir));
		win.on("closed",function() {
			win = null;
		});
	}
};
var electron_App = require("app");
var electron_BrowserWindow = require("browser-window");
var electron_Menu = require("menu");
var electron__$MenuItem_MenuItem_$Impl_$ = {};
electron__$MenuItem_MenuItem_$Impl_$.fromDynamic = function(o) {
	var options = o;
	return options;
};
Main.main();
})(typeof console != "undefined" ? console : {log:function(){}});
