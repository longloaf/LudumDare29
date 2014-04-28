package com.longloaf.house 
{
	import org.flixel.FlxG;
	/**
	 * ...
	 * @author Maksim Soldatov
	 */
	public class HoleTrigger extends Trigger
	{
		[Embed(source = "data/image/holeTrigger_300x90_2.png")]
		private static const Img:Class;
		
		public function HoleTrigger(h:HouseState) 
		{
			super(h);
			
			loadGraphic(Img, true, false, 300, 90);
			x = 332;
			y = 472;
		}
		
	}

}