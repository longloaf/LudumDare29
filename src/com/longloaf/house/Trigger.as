package com.longloaf.house 
{
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author Maksim Soldatov
	 */
	public class Trigger extends FlxSprite
	{
		
		static public const NORMAL:int = 0;
		static public const HIGHLIGHT:int = 1;
		
		private var houseState:HouseState;
		
		public var onClick:Function = null;
		
		public function Trigger(h:HouseState) 
		{
			houseState = h;
		}
		
		override public function update():void 
		{
			frame = NORMAL;
			if (houseState.triggerFlag && overlapsPoint(FlxG.mouse)) {
				frame = HIGHLIGHT;
				if (FlxG.mouse.justPressed() && (onClick != null)) {
					onClick();
				}
			}
		}
		
	}

}