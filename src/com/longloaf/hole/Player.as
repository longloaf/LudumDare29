package com.longloaf.hole 
{
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;
	import org.flixel.FlxU;
	/**
	 * ...
	 * @author Maksim Soldatov
	 */
	public class Player extends FlxSprite
	{
		private static const T:Number = 0.2;
		
		private var t:Number = 0;
		
		private var xs:Vector.<Number> = Vector.<Number>([240, 400, 560]);
		private var pos:int = 1;
		private var nextPos:int = pos;
		
		public function Player() 
		{
			makeGraphic(50, 50, FlxU.makeColorFromHSB(100, 0.8, 0.5));
			
			x = xs[pos] - width / 2;
			y = 50;
		}
		
		override public function update():void 
		{
			if (t > 0) {
				t -= FlxG.elapsed;
				if (t <= 0) {
					pos = nextPos;
				}
				x = xs[pos] + (nextPos - pos) * Math.abs(xs[nextPos] - xs[pos]) * (1 - t / T) - width / 2;
			} else {
				nextPos = pos;
				if (FlxG.keys.LEFT || FlxG.keys.A) {
					if (pos > 0) {
						--nextPos;
					}
				}
				if (FlxG.keys.RIGHT || FlxG.keys.D) {
					if (pos < (xs.length - 1)) {
						++nextPos;
					}
				}
				if (nextPos != pos) {
					t = T;
				}
			}
		}
		
	}

}