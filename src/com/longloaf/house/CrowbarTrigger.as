package com.longloaf.house 
{
	import com.longloaf.sound.Snd;
	import org.flixel.FlxG;
	/**
	 * ...
	 * @author Maksim Soldatov
	 */
	public class CrowbarTrigger extends Trigger
	{
		[Embed(source = "data/image/crowbarTrigger_120x50_2.png")]
		private static const Img:Class;
		
		public function CrowbarTrigger(h:HouseState) 
		{
			super(h);
			
			loadGraphic(Img, true, false, 120, 50);
			x = 282;
			y = 433;
			
			onClick = function():void
			{
				kill();
				houseState.item = HouseState.CROWBAR_ITEM;
				FlxG.play(Snd.OK);
			};
		}
		
	}

}