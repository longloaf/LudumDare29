package com.longloaf.hole 
{
	import com.longloaf.TestMenu;
	import org.flixel.FlxG;
	import org.flixel.FlxGroup;
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	import org.flixel.FlxU;
	/**
	 * ...
	 * @author Maksim Soldatov
	 */
	public class HoleState extends FlxState
	{
		public static const VEL:Number = -200;
		
		private var bg:Bg;
		
		private var player:Player;
		
		private var spikeGroup:FlxGroup;
		
		override public function create():void 
		{
			var s1:FlxSprite = new FlxSprite();
			s1.makeGraphic(FlxG.width, FlxG.height, FlxU.makeColorFromHSB(30, 0.2, 0.8));
			add(s1);
			
			var s2:FlxSprite = new FlxSprite();
			s2.makeGraphic(400,  FlxG.height, FlxU.makeColorFromHSB(25, 0.4, 0.4));
			s2.x = (FlxG.width - s2.width) / 2;
			add(s2);
			
			bg = new Bg();
			
			player = new Player();
			
			spikeGroup = new FlxGroup();
			
			add(bg);
			add(player);
			add(spikeGroup);
		}
		
		override public function update():void 
		{
			if (FlxG.keys.justPressed("ONE")) {
				makeSpikes1();
			} else if (FlxG.keys.justPressed("TWO")) {
				makeSpikes2();
			}
			
			super.update();
			
			if (FlxG.keys.justPressed("ESCAPE")) {
				FlxG.switchState(new TestMenu());
			}
		}
		
		private function makeSpikes1():void
		{
			var s:Spikes = spikeGroup.recycle(Spikes) as Spikes;
			s.resetSpikes(int(FlxG.random() *  3));
		}
		
		private function makeSpikes2():void
		{
			var n:int = int(FlxG.random() * Spikes.POSNUM);
			for (var i:int = 0; i < Spikes.POSNUM; ++i) {
				if (i != n) {
					var s:Spikes = spikeGroup.recycle(Spikes) as Spikes;
					s.resetSpikes(i);
				}
			}
		}
		
	}

}