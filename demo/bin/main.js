(function (console) { "use strict";
var Main = function() {
	electron_Electron.require("app").on("window-all-closed",function() {
		electron_Electron.require("app").quit();
	});
	electron_Electron.require("app").on("ready",function() {
		var mainWindow = new electron_ElectronBrowserWindow({ width : 800, height : 600});
		mainWindow.loadUrl("file://" + __dirname + "/index.html");
	});
};
Main.main = function() {
	new Main();
};
var electron_Electron = function() { };
var electron_ElectronBrowserWindow = require("browser-window");
electron_Electron.require = require;
Main.main();
})(typeof console != "undefined" ? console : {log:function(){}});
