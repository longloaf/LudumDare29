package com.longloaf 
{
	import com.longloaf.house.HouseState;
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	/**
	 * ...
	 * @author Maksim Soldatov
	 */
	public class MenuState extends FlxState
	{
		[Embed(source = "menuState.png")]
		private static const Img:Class;
		
		override public function create():void 
		{
			var s:FlxSprite = new FlxSprite(0, 0, Img);
			add(s);
		}
		
		override public function update():void 
		{
			super.update();
			if (FlxG.keys.justPressed("ENTER")) {
				FlxG.switchState(new HouseState());
			}
		}
		
	}

}