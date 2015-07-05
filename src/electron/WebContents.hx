package electron;

import haxe.extern.Rest;
import js.Node;

@:enum
abstract WebContentsEvent(String) to String {
	var DID_FINISH_LOAD				= "did-finish-load";
	var DID_FAIL_LOAD				= "did-fail-load";
	var DID_FRAME_FINISH_LOAD		= "did-frame-finish-load";
	var DID_START_LOADING			= "did-start-loading";
	var DID_STOP_LOADING			= "did-stop-loading";
	var DID_GET_RESPONSE_DETAILS	= "did-get-response-details";
	var DID_GET_REDIRECT_REQUEST	= "did-get-redirect-request";
	var DOM_READY					= "dom-ready";
	var PAGE_FAVICON_UPDATED		= "page-favicon-updated";
	var NEW_WINDOW					= "new-window";
	var WILL_NAVIGATE				= "will-navigate";
	var CRASHED						= "crashed";
	var PLUGIN_CRASHED				= "plugin-crashed";
	var DESTROYED					= "destroyed";
}

extern class WebContents
{
	public function loadUrl(url:String, ?options: { ?httpReferrer:String, ?userAgent:String } ):Void;
	public function getUrl():String;
	public function getTitle():String;
	public function isLoading():Bool;
	public function isWaitingForResponse():Bool;
	public function stop():Void;
	public function reload():Void;
	public function reloadIgnoringCache():Void;
	public function canGoBack():Bool;
	public function canGoForward():Bool;
	public function canGoToOffset(offset:Int):Bool;
	public function clearHistory():Void;
	public function goBack():Void;
	public function goForward():Void;
	public function goToIndex(index:Int):Void;
	public function goToOffset(offset:Int):Void;
	public function isCrashed():Bool;
	public function setUserAgent(userAgent:String):Void;
	public function insertCSS(css:String):Void;
	public function executeJavaScript(code:String):Void;
	public function setAudioMuted(muted:Bool):Void;
	public function isAudioMuted():Bool;
	public function undo():Void;
	public function redo():Void;
	public function cut():Void;
	public function copy():Void;
	public function paste():Void;
	public function pasteAndMatchStyle():Void;
	public function delete():Void;
	public function selectAll():Void;
	public function unselect():Void;
	public function replace(text:String):Void;
	public function replaceMisspelling(text:String):Void;
	public function hasServiceWorker(callback:NodeListener):Bool;
	public function unregisterServiceWorker(callback:NodeListener):Bool;
	public function print(?options: { ?silent:Bool, ?printBackground:Bool } ):Void;
	public function printToPDF(options: { ?marginsType:Int, ?printBackground:Bool, ?printSelectionOnly:Bool, ?landscape:Bool }, callback:NodeListener):Void;
	public function send(channel:String, args:Rest<Dynamic>):Void;
	
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
