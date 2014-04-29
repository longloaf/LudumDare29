package com.longloaf 
{
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author Maksim Soldatov
	 */
	public class ControlsText extends FlxSprite
	{
		private const N:int = 20;
		private var n:int = 0;
		private const T:Number = 0.3;
		private var t:Number = 0;;
		
		public function ControlsText() 
		{
			antialiasing = true;
			scrollFactor.make();
		}
		
		override public function update():void 
		{
			t += FlxG.elapsed;
			if (t >= T) {
				t -= T;
				++n;
				if (n >= N) {
					kill();
				} else {
					if (scale.x == 1) {
						scale.x = scale.y = 0.99;
					} else {
						scale.x = scale.y = 1;
					}
				}
			}
		}
		
	}

}