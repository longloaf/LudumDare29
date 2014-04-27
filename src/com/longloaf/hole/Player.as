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
		
		public function Player() 
		{
			makeGraphic(50, 50, FlxU.makeColorFromHSB(100, 0.8, 0.5));
			
			x = (FlxG.width - width) / 2;
			y = 100;
		}
		
		override public function update():void 
		{
			
		}
		
	}

}