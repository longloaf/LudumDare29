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
			width = 120;
			height = 30;
			centerOffsets();
			
			x = 273;
			y = 444;
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