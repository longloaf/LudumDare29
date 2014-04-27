package com.longloaf.hell 
{
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author Maksim Soldatov
	 */
	public class Bullet extends FlxSprite
	{
		
		private const T:Number = 1;
		private var t:Number = 0;
		
		public static const V:Number = 1000;
		
		public function Bullet() 
		{
			makeGraphic(10, 10, 0xFFFFFF00);
		}
		
		override public function reset(X:Number, Y:Number):void 
		{
			super.reset(X, Y);
			t = 0;
		}
		
		override public function update():void 
		{
			t += FlxG.elapsed;
			if (t > T) {
				kill();
			}
		}
		
	}

}