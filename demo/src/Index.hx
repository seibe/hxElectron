package;

import electron.Electron;
import electron.ElectronNativeImage;
import js.Node;

class Index 
{
	static function main() 
	{
		new Index();
	}
	
	public function new()
	{
		Electron.remote.getCurrentWindow().capturePage(function(img:ElectronNativeImage):Void {
			Node.fs.writeFile('screenshot.png', img.toPng(), null);
		});
	}
	
}
