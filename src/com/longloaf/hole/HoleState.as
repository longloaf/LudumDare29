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
			
			player = new Player();
			
			spikeGroup = new FlxGroup();
			
			add(player);
			add(spikeGroup);
		}
		
		override public function update():void 
		{
			if (FlxG.mouse.justPressed()) {
				var s:Spikes = spikeGroup.recycle(Spikes) as Spikes;
				s.resetSpikes(int(FlxG.random() *  3));
				FlxG.log(spikeGroup.length);
			}
			
			super.update();
			
			if (FlxG.keys.justPressed("ESCAPE")) {
				FlxG.switchState(new TestMenu());
			}
		}
		
	}

}