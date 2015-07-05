package electron;

import js.Node;

typedef MenuItemConfig =
{
	label:String,
	?click:NodeListener,
	?selector:String,
	?type:String,
	?sublabel:String,
	?accelerator:Accelerator,
	?icon:NativeImage,
	?enabled:Bool,
	?visible:Bool,
	?checked:Bool,
	?submenu:Array<MenuItem>,
	?id:String,
	?position:String
}

abstract MenuItem(MenuItemConfig) to MenuItemConfig
{
	inline function new(options:MenuItemConfig) {
		this = options;
	}
	
	@:from
	static public function fromDynamic(o:Dynamic) {
		return new MenuItem(o);
	}
}
