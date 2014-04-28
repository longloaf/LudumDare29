package com.longloaf.house 
{
	/**
	 * ...
	 * @author Maksim Soldatov
	 */
	public class OpenedDoorTrigger extends Trigger
	{
		[Embed(source = "data/image/openedDoorTrigger_90x170_2.png")]
		private static const Img:Class;
		
		public function OpenedDoorTrigger(h:HouseState) 
		{
			super(h);
			
			loadGraphic(Img, true, false, 90, 170);
			
			width = 70;
			height = 120;
			centerOffsets();
		}
		
	}

}