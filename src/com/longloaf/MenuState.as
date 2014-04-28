package com.longloaf 
{
	import com.longloaf.house.HouseState;
	import org.flixel.FlxG;
	import org.flixel.FlxState;
	/**
	 * ...
	 * @author Maksim Soldatov
	 */
	public class MenuState extends FlxState
	{
		
		override public function create():void 
		{
			
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