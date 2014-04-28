package com.longloaf.house 
{
	import org.flixel.FlxG;
	/**
	 * ...
	 * @author Maksim Soldatov
	 */
	public class BoardsTrigger extends Trigger
	{
		[Embed(source = "data/image/boardsTrigger_150x300_2.png")]
		private static const Img:Class;
		
		public function BoardsTrigger(h:HouseState) 
		{
			super(h);
			
			loadGraphic(Img, true, false, 150, 300);
			width = 120;
			height = 220;
			centerOffsets();
			
			x = 621;
			y = 278;
			
			onClick = function():void
			{
				if (houseState.item == HouseState.CROWBAR_ITEM) {
					kill();
					houseState.room3.rightTrigger.exists = true;
					houseState.item = HouseState.NO_ITEM;
				}
			};
		}
		
	}

}