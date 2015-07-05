package electron;

import haxe.extern.Rest;
import js.Node;

@:enum
abstract AppEvent(String) to String
{
	var WILL_FINISH_LAUNCHING			= "will-finish-launching";
	var READY							= "ready";
	var WINDOW_ALL_CLOSED				= "window-all-closed";
	var BEFORE_QUIT						= "before-quit";
	var WILL_QUIT						= "will-quit";
	var QUIT							= "quit";
	var OPEN_FILE						= "open-file";
	var OPEN_URL						= "open-url";
	var ACTIVATE_WITH_NO_OPEN_WINDOWS	= "activate-with-no-open-windows";
	var BROWSER_WINDOW_BLUR				= "browser-window-blur";
	var BROWSER_WINDOW_FOCUS			= "browser-window-focus";
	var SELECT_CERTIFICATE				= "select-certificate";
	var GPU_PROCESS_CRASHED				= "gpu-process-crashed";
}

typedef AppTask =
{
	@:optional var program:String;
	@:optional var arguments:String;
	@:optional var title:String;
	@:optional var description:String;
	@:optional var iconPath:String;
	@:optional var iconIndex:Int;
}

typedef AppCommandLine =
{
	function appendSwitch(command:String, ?value:Dynamic):Void;
	function appendArgument(value:Dynamic):Void;
}

typedef AppDock =
{
	function bounce(?type:String):Int;
	function cancelBounce(id:Int):Void;
	function setBadge(text:String):Void;
	function getBadge():String;
	function hide():Void;
	function show():Void;
	function setMenu(menu:Menu):Void;
}

@:jsRequire('app')
extern class App
{
	public static function quit():Void;
	public static function getPath(name:String):Dynamic;
	public static function setPath(name:String, path:String):Void;
	public static function getVersion():String;
	public static function getName():String;
	public static function resolveProxy(url:String, callback:NodeListener):Void;
	public static function addRecentDocument(path:String):Void;
	public static function clearRecentDocuments():Void;
	public static function setUserTasks(tasks:Array<AppTask>):Void;
	
	public static var commandLine(default,null):AppCommandLine;
	public static var dock(default,null):AppDock;
	
	// extends EventEmitter
	public static function addListener(event:String, fn:NodeListener):Dynamic;
	public static function on(event:String, fn:NodeListener):Dynamic;
	public static function once(event:String, fn:NodeListener):Void;
	public static function removeListener(event:String, listener:NodeListener):Void;
	public static function removeAllListeners(event:String):Void;
	public static function listeners(event:String):Array<NodeListener>;
	public static function setMaxListeners(m:Int):Void;
	public static function emit(event:String, args:Rest<Dynamic>):Void;
}
