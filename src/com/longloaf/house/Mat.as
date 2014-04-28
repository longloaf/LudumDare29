package com.longloaf.house 
{
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author Maksim Soldatov
	 */
	public class Mat extends FlxSprite
	{
		[Embed(source = "data/image/mat_150x70.png")]
		private static const Img:Class;
		
		public function Mat() 
		{
			loadGraphic(Img);
			
			x = 258;
			y = 428;
		}
		
		/*
		override public function update():void 
		{
			x = FlxG.mouse.x;
			y = FlxG.mouse.y;
		}
		*/
		
	}

}