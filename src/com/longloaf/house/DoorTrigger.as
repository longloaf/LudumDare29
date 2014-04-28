package com.longloaf.house 
{
	import com.longloaf.sound.Snd;
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
			
			onClick = function():void
			{
				if (houseState.item == item) {
					kill();
					houseState.item = HouseState.NO_ITEM;
					if (openedDoorTrigger != null) {
						openedDoorTrigger.exists = true;
					}
					FlxG.play(Snd.OK);
				} else {
					FlxG.play(Snd.ERR);
				}
			};
		}
			
	}

}