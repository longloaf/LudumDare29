package com.longloaf.house 
{
	import org.flixel.FlxG;
	/**
	 * ...
	 * @author Maksim Soldatov
	 */
	public class Key1Trigger extends Trigger
	{
		[Embed(source = "data/image/key1Trigger_20x40_2.png")]
		private static const Img:Class;
		
		public function Key1Trigger(h:HouseState) 
		{
			super(h);
			loadGraphic(Img, true, false, 20, 40);
			
			x = 369;
			y = 444;
		}
		
	}

}