package com.longloaf 
{
	import org.flixel.FlxG;
	/**
	 * ...
	 * @author Maksim Soldatov
	 */
	public class HouseControls extends ControlsText
	{
		[Embed(source = "houseControls.png")]
		private static const Img:Class;
		
		public function HouseControls() 
		{
			loadGraphic(Img);
			x = (FlxG.width - width) / 2;
			y = 20;
		}
		
	}

}