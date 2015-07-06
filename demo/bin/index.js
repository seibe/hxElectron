(function (console) { "use strict";
var Index = function() {
	electron_Electron.require("remote").getCurrentWindow().capturePage(function(img) {
		js_Node.require("fs").writeFile("screenshot.png",img.toPng(),null);
	});
};
Index.main = function() {
	new Index();
};
var electron_Electron = function() { };
var js_Node = function() { };
electron_Electron.require = require;
js_Node.require = require;
Index.main();
})(typeof console != "undefined" ? console : {log:function(){}});
