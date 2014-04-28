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
		[Embed(source = "data/image/bullet.png")]
		private static const Img:Class;
		
		private const T:Number = 1;
		private var t:Number = 0;
		
		public static const V:Number = 1000;
		
		public function Bullet() 
		{
			//makeGraphic(20, 20, 0xFFFFFF00);
			loadGraphic(Img);
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