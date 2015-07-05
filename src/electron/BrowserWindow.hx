package electron;

import haxe.extern.Rest;
import js.Node;

@:enum
abstract BrowserWindowEvent(String) to String
{
	var PAGE_TITLE_UPDATED		= "page-title-updated";
	var CLOSE					= "close";
	var CLOSED					= "closed";
	var UNRESPONSIVE			= "unresponsive";
	var RESPONSIVE				= "responsive";
	var BLUR					= "blur";
	var FOCUS					= "focus";
	var MAXIMIZE				= "maximize";
	var UNMAXIMIZE				= "unmaximize";
	var RESTORE					= "restore";
	var RESIZE					= "resize";
	var MOVE					= "move";
	var MOVED					= "moved"; // available only on OS X
	var ENTER_FULL_SCREEN		= "enter-full-screen";
	var LEAVE_FULL_SCREEN		= "leave-full-screen";
	var ENTER_HTML_FULL_SCREEN	= "enter-html-full-screen";
	var LEAVE_HTML_FULL_SCREEN	= "leave-html-full-screen";
	var DEVTOOLS_OPENED			= "devtools-opened";
	var DEVTOOLS_CLOSED			= "devtools-closed";
	var DEVTOOLS_FOCUSED		= "devtools-focused";
	var APP_COMMAND				= "app-command";
}

@:jsRequire('browser-window')
extern class BrowserWindow
{
	public function new(options:Dynamic);
	
	public static function getAllWindows():Array<BrowserWindow>;
	public static function getFocusedWindow():BrowserWindow;
	public static function fromWebContents(webContents:WebContents):BrowserWindow;
	public static function fromId(id:Int):BrowserWindow;
	public static function addDevToolsExtension(path:String):Void;
	public static function removeDevToolsExtension(name:String):Void;
	
	public var webContents(default,null):WebContents;
	public var devToolsWebContents(default, null):WebContents;
	public var id(default, null):Int;
	
	public function destroy():Void;
	public function close():Void;
	public function focus():Void;
	public function isFocused():Bool;
	public function show():Void;
	public function showInactive():Void;
	public function hide():Void;
	public function isVisible():Bool;
	public function maximize():Void;
	public function unmaximize():Void;
	public function isMaximized():Bool;
	public function minimize():Void;
	public function restore():Void;
	public function isMinimized():Bool;
	public function setFullScreen(flag:Bool):Void;
	public function isFullScreen():Bool;
	public function setBounds(options:{ x:Int, y:Int, width:Int, height:Int }):Void;
	public function getBounds():{ x:Int, y:Int, width:Int, height:Int };
	public function setSize(width:Int, height:Int):Void;
	public function getSize():Array<Int>;
	public function setMinimumSize(width:Int, height:Int):Void;
	public function getMinimumSize():Array<Int>;
	public function setMaximumSize(width:Int, height:Int):Void;
	public function getMaximumSize():Array<Int>;
	public function setResizable(resizable:Bool):Void;
	public function isResizable():Bool;
	public function setAlwaysOnTop(flag:Bool):Void;
	public function isAlwaysOnTop():Bool;
	public function center():Void;
	public function setPosition(x:Int, y:Int):Void;
	public function getPosition():Array<Int>;
	public function setTitle(title:String):Void;
	public function getTitle():String;
	public function flashFrame(flag:Bool):Void;
	public function setSkipTaskbar(skip:Bool):Void;
	public function setKiosk(flag:Bool):Void;
	public function isKiosk():Bool;
	public function setRepresentedFilename(filename:String):Void; // available only on OS X
	public function getRepresentedFilename():String; // available only on OS X
	public function setDocumentEdited(edited:Bool):Void; // available only on OS X
	public function isDocumentEdited():String; // available only on OS X
	public function openDevTools(?options: { detach:Bool } ):Void;
	public function closeDevTools():Void;
	public function isDevToolsOpened():Bool;
	public function toggleDevTools():Void;
	public function inspectElement(x:Int, y:Int):Void;
	public function inspectServiceWorker():Void;
	public function focusOnWebView():Void;
	public function blurWebView():Void;
	
	@:overload(function(rect:{ x:Int, y:Int, width:Int, height:Int }, callback:NodeListener):Void{})
	public function capturePage(callback:NodeListener):Void;
	
	public function setMenu(menu:Menu):Void; // does nothing on OS X
	public function setProgressBar(progress:Float):Void;
	public function setOverlayIcon(overlay:NativeImage, description:String):Void; // available only on Windows
	public function showDefinitionForSelection():Void; // available only on OS X
	public function setAutoHideMenuBar(hide:Bool):Void;
	public function isMenuBarAutoHide():Bool;
	public function setMenuBarVisibility(visible:Bool):Void;
	public function isMenuBarVisible():Bool;
	public function setVisibleOnAllWorkspaces(visible:Bool):Void; // does nothing on Windows
	public function isVisibleOnAllWorkspaces():Bool; // does nothing on Windows
	
	// same with webContents
	public function print(?options: { ?silent:Bool, ?printBackground:Bool } ):Void;
	public function printToPDF(options: { ?marginsType:Int, ?printBackground:Bool, ?printSelectionOnly:Bool, ?landscape:Bool }, callback:NodeListener):Void;
	public function loadUrl(url:String, ?options: { ?httpReferrer:String, ?userAgent:String } ):Void;
	public function reload():Void;
	public function reloadIgnoringCache():Void;
	
	// extends EventEmitter
	public function addListener(event:String, fn:NodeListener):Dynamic;
	public function on(event:String, fn:NodeListener):Dynamic;
	public function once(event:String, fn:NodeListener):Void;
	public function removeListener(event:String, listener:NodeListener):Void;
	public function removeAllListeners(event:String):Void;
	public function listeners(event:String):Array<NodeListener>;
	public function setMaxListeners(m:Int):Void;
	public function emit(event:String, args:Rest<Dynamic>):Void;
}
