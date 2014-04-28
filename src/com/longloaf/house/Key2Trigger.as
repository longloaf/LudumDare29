package com.longloaf.house 
{
	import com.longloaf.sound.Snd;
	import org.flixel.FlxG;
	/**
	 * ...
	 * @author Maksim Soldatov
	 */
	public class Key2Trigger extends Trigger
	{
		[Embed(source = "data/image/key2Trigger_40x20_2.png")]
		private static const Img:Class;
		
		public function Key2Trigger(h:HouseState) 
		{
			super(h);
			
			loadGraphic(Img, true, false, 40, 20);
			x = 273;
			y = 369;
			
			onClick = function():void
			{
				kill();
				houseState.item = HouseState.KEY2_ITEM;
				FlxG.play(Snd.OK);
			};
		}
		
	}

}