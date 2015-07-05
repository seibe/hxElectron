package;

import js.Node;
import electron.App;
import electron.BrowserWindow;
import electron.Menu;
import electron.MenuItem;

/**
 * @author seibe
 */
class Main 
{
	static function main() 
	{
		new Main();
	}
	
	public function new()
	{
		var template:Array<MenuItem> = [{ label: "View", submenu: [
			{ label: "Reload", accelerator: "Ctrl+R", click: function():Void { BrowserWindow.getFocusedWindow().reloadIgnoringCache(); } },
			{ label: "Toggle DevTools", accelerator: "Alt+Ctrl+I", click: function():Void { BrowserWindow.getFocusedWindow().toggleDevTools(); } }
		] }];
		var menu:Menu = Menu.buildFromTemplate(template);
		
		App.on(AppEvent.WINDOW_ALL_CLOSED, function():Void {
			App.quit();
		});
		
		App.on(AppEvent.READY, function():Void {
			openWindow("0");
			Menu.setApplicationMenu(menu);
		});
	}
	
	private function openWindow(baseDir:String):Void
	{
		var win:BrowserWindow = new BrowserWindow({ width: 800, height: 600 });
		win.loadUrl('file://' + Node.__dirname + '/index.html?baseDir=' + StringTools.urlEncode(baseDir));
		win.on(BrowserWindowEvent.CLOSED, function() {
			win = null;
		});
	}
	
}
