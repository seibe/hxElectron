package;

import electron.Electron;
import electron.ElectronBrowserWindow;
import js.Node;

class Main 
{
	static function main() 
	{
		new Main();
	}
	
	public function new()
	{
		Electron.app.on(ElectronAppEventType.WINDOW_ALL_CLOSED, function():Void {
			Electron.app.quit();
		});
		
		Electron.app.on(ElectronAppEventType.READY, function():Void {
			var mainWindow = new ElectronBrowserWindow({ width: 800, height: 600 });
			mainWindow.loadUrl('file://' + Node.__dirname + '/index.html');
		});
	}
	
}
