package com.longloaf.hole 
{
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author Maksim Soldatov
	 */
	public class BgSpr extends FlxSprite
	{
		
		[Embed(source = "data/image/hole_400x400.png")]
		private static const Img:Class;
		
		public function BgSpr() 
		{
			loadGraphic(Img);
		}
		
		override public function update():void 
		{
			velocity.y = -HoleState.FOBJ.velocity.y;
			if (y < -height) {
				kill();
			}
		}
		
	}

}