package com.longloaf.house 
{
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author Maksim Soldatov
	 */
	public class Items extends FlxSprite
	{
		[Embed(source = "data/image/items_150x150_4.png")]
		private static const Img:Class;
		
		private const T:Number = 0.3;
		private var t:Number = 0;
		
		private const A1:Number = 0;
		private const A2:Number = -5;
		
		private var houseState:HouseState;
		
		public function Items(h:HouseState) 
		{
			loadGraphic(Img, true, false, 150, 150);
			antialiasing = true;
			
			houseState = h;
			
			x = y = 10;
		}
		
		override public function update():void 
		{
			t += FlxG.elapsed;
			if (t > T) {
				t -= T;
				/*
				if (scale.x == 1) {
					scale.x = scale.y = 0.95;
				} else {
					scale.x = scale.y = 1;
				}
				*/
				if (angle == A1) {
					angle = A2;
				} else {
					angle = A1;
				}
			}
			frame = houseState.item;
		}
		
	}

}