package electron;

import js.Node;
import electron.MenuItem;

@:jsRequire('menu')
extern class Menu
{
	public function new();
	
	public static function setApplicationMenu(menu:Menu):Void;
	public static function sendActionToFirstResponder(action:String):Void; // available only on OS X
	public static function buildFromTemplate(template:Array<MenuItem>):Menu;
	
	public function popup(browserWindow:BrowserWindow, ?x:Int, ?y:Int):Void;
	public function append(menuItem:MenuItem):Void;
	public function insert(pos:Int, menuItem:MenuItem):Void;
	public var items:Array<MenuItem>;
}
