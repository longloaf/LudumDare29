package com.longloaf.hole 
{
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author Maksim Soldatov
	 */
	public class BgSpr extends FlxSprite
	{
		[Embed(source = "bg_img.png")]
		private static const Img:Class;
		
		public function BgSpr() 
		{
			loadGraphic(Img);
		}
		
		override public function update():void 
		{
			if (y < -height) {
				kill();
			}
		}
		
	}

}