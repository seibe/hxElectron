package electron;

extern class NativeImage
{
	public static function createEmpty():NativeImage;
	public static function createFromPath(path:String):NativeImage;
	public static function createFromBuffer(buffer:Dynamic, ?scaleFactor:Float):NativeImage;
	public static function createFromDataUrl(dataUrl:String):NativeImage;
	
	public function toPng():Dynamic;
	public function toJpeg(quality:Int):Dynamic;
	public function toDataUrl():String;
	public function isEmpty():Bool;
	public function getSize():Int;
	public function setTemplateImage(option:Bool):Void;
}