package com.longloaf.house 
{
	import com.longloaf.sound.Snd;
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
			width = 120;
			height = 30;
			centerOffsets();
			
			x = 614;
			y = 444;
			
			onClick = function():void
			{
				kill();
				houseState.room1.mat.exists = true;
				houseState.room1.key1Trigger.exists = true;
				FlxG.play(Snd.OK);
			}
		}
		
	}

}