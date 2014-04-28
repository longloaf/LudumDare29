package com.longloaf.house 
{
	import org.flixel.FlxG;
	/**
	 * ...
	 * @author Maksim Soldatov
	 */
	public class RightTrigger extends Trigger
	{
		[Embed(source = "data/image/rightTrigger_70x200_2.png")]
		private static const Img:Class;
		
		public function RightTrigger(h:HouseState) 
		{
			super(h);
			
			loadGraphic(Img, true, false, 70, 200);
		}
		
	}

}