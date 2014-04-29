package com.longloaf 
{
	import org.flixel.FlxG;
	/**
	 * ...
	 * @author Maksim Soldatov
	 */
	public class HellControls extends ControlsText
	{
		[Embed(source = "hellControls.png")]
		private static const Img:Class;
		
		public function HellControls() 
		{
			loadGraphic(Img);
			x = (FlxG.width - width) / 2;
			y = 20;
		}
		
	}

}