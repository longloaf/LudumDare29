package com.longloaf 
{
	import org.flixel.FlxG;
	/**
	 * ...
	 * @author Maksim Soldatov
	 */
	public class HoleControls extends ControlsText
	{
		[Embed(source = "holeControls.png")]
		private static const Img:Class;
		
		public function HoleControls() 
		{
			loadGraphic(Img);
			x = (FlxG.width - width) / 2;
			y = FlxG.height - height - 20;
		}
		
	}

}