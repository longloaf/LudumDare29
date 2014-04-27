package com.longloaf.hell 
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
		
		private static const ACC:Number = 700;
		
		public function Player() 
		{
			makeGraphic(50, 50, FlxU.makeColorFromHSB(100, 0.7, 0.7));
			
			maxVelocity.x = maxVelocity.y = 300;
			drag.x = drag.y = ACC;
		}
		
		override public function update():void 
		{
			acceleration.make();
			
			if (FlxG.keys.LEFT || FlxG.keys.A) {
				acceleration.x -= ACC;
			}
			if (FlxG.keys.RIGHT || FlxG.keys.D) {
				acceleration.x += ACC;
			}
			
			if (FlxG.keys.UP || FlxG.keys.W) {
				acceleration.y -= ACC;
			}
			if (FlxG.keys.DOWN || FlxG.keys.S) {
				acceleration.y += ACC;
			}
		}
		
	}

}