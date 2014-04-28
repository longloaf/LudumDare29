package com.longloaf.hole 
{
	import org.flixel.FlxG;
	import org.flixel.FlxGroup;
	/**
	 * ...
	 * @author Maksim Soldatov
	 */
	public class SpikeGroup extends FlxGroup
	{
		private const DMIN:Number = 600;// 1000;
		private const DMAX:Number = 900;// 1500;
		
		private var y:Number = 1000;
		
		public var count:int = 0;
		public static const MAX_COUNT:int = 50;
		
		public function SpikeGroup() 
		{
			
		}
		
		override public function update():void 
		{
			if ((count < MAX_COUNT) && (HoleState.FOBJ.y > y)) {
				if ((count > 10) && (FlxG.random() > 0.5)) {
					makeSpikes2();
				} else {
					makeSpikes1();
				}
				
				++count;
				y += DMIN + (DMAX - DMIN) * FlxG.random();
			}
			super.update();
		}
		
		private function makeSpikes1():void
		{
			var s:Spikes = recycle(Spikes) as Spikes;
			s.resetSpikes(int(FlxG.random() *  3));
		}
		
		private function makeSpikes2():void
		{
			var n:int = int(FlxG.random() * Spikes.POSNUM);
			for (var i:int = 0; i < Spikes.POSNUM; ++i) {
				if (i != n) {
					var s:Spikes = recycle(Spikes) as Spikes;
					s.resetSpikes(i);
				}
			}
		}
		
	}

}