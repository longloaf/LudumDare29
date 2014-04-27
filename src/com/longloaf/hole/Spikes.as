package com.longloaf.hole 
{
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;
	import org.flixel.FlxU;
	/**
	 * ...
	 * @author Maksim Soldatov
	 */
	public class Spikes extends FlxSprite
	{	
		public static const L:int = 0;
		public static const C:int = 1;
		public static const R:int = 2;
		public static const POSNUM:int = 3;
		
		public function Spikes() 
		{
			makeGraphic(150, 150, FlxU.makeColorFromHSB(20, 0.8, 0.8));
		}
		
		public function resetSpikes(pos:int):void
		{
			var nx:Number;
			if (pos == L) {
				nx = 200;
			} else if (pos == C) {
				nx = 400 - width / 2;
			} else if (pos == R) {
				nx = 600 - width;
			} else {
				throw new Error();
			}
			
			reset(nx, FlxG.height);
		}
		
		override public function update():void 
		{
			velocity.y = -HoleState.FOBJ.velocity.y;
			if (y < -height) {
				kill();
			}
		}
		
	}

}