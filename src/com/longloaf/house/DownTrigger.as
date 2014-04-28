package com.longloaf.house 
{
	import org.flixel.FlxG;
	/**
	 * ...
	 * @author Maksim Soldatov
	 */
	public class DownTrigger extends Trigger
	{
		[Embed(source = "data/image/downTrigger_800x80_2.png")]
		private static const Img:Class;
		
		public function DownTrigger(h:HouseState) 
		{
			super(h);
			
			loadGraphic(Img, true, false, 800, 80);
			
			y = FlxG.height - height;
		}
		
	}

}