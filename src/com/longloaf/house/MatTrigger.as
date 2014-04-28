package com.longloaf.house 
{
	import org.flixel.FlxG;
	/**
	 * ...
	 * @author Maksim Soldatov
	 */
	public class MatTrigger extends Trigger
	{
		[Embed(source = "data/image/matTrigger_150x70_2.png")]
		private static const Img:Class;
		
		public function MatTrigger(h:HouseState) 
		{
			super(h);
			loadGraphic(Img, true, false, 150, 70);
			x = 258;
			y = 428;
			
			onClick = function():void
			{
				kill();
				houseState.room1.mat.exists = true;
				houseState.room1.key1Trigger.exists = true;
			}
		}
		
	}

}