package com.longloaf.house 
{
	import org.flixel.FlxG;
	/**
	 * ...
	 * @author Maksim Soldatov
	 */
	public class DoorTrigger extends Trigger
	{
		[Embed(source = "data/image/doorTrigger_90x170_2.png")]
		private static const Img:Class;
		
		public var item:int = HouseState.NO_ITEM;
		public var openedDoorTrigger:OpenedDoorTrigger = null;
		
		public function DoorTrigger(h:HouseState) 
		{
			super(h);
			
			loadGraphic(Img, true, false, 90, 170);
			width = 70;
			height = 120;
			centerOffsets();
			
			x = 297;
			y = 317;
			
			onClick = function():void
			{
				if (houseState.item == item) {
					kill();
					houseState.item = HouseState.NO_ITEM;
					if (openedDoorTrigger != null) {
						openedDoorTrigger.exists = true;
					}
				}
			};
		}
			
	}

}