package com.longloaf.hole 
{
	import com.longloaf.TestMenu;
	import org.flixel.FlxG;
	import org.flixel.FlxGroup;
	import org.flixel.FlxObject;
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	import org.flixel.FlxText;
	import org.flixel.FlxU;
	/**
	 * ...
	 * @author Maksim Soldatov
	 */
	public class HoleState extends FlxState
	{
		
		public static var FOBJ:FlxSprite;
		
		private var velText:FlxText;
		private var spikeText:FlxText;
		
		private var bg:Bg;
		
		private var player:Player;
		
		private var spikeGroup:SpikeGroup;
		
		override public function create():void 
		{
			FOBJ = new FlxSprite();
			FOBJ.reset(0, FlxG.height);
			FOBJ.velocity.y = 500;
			FOBJ.acceleration.y = 5;
			FOBJ.visible = false;
			add(FOBJ);
			
			var s1:FlxSprite = new FlxSprite();
			s1.makeGraphic(FlxG.width, FlxG.height, FlxU.makeColorFromHSB(30, 0.2, 0.8));
			add(s1);
			
			var s2:FlxSprite = new FlxSprite();
			s2.makeGraphic(400,  FlxG.height, FlxU.makeColorFromHSB(25, 0.4, 0.4));
			s2.x = (FlxG.width - s2.width) / 2;
			add(s2);
			
			bg = new Bg();
			
			player = new Player();
			
			spikeGroup = new SpikeGroup();
			
			velText = new FlxText(0, 0, FlxG.width, "?");
			velText.size = 16;
			velText.color = FlxG.WHITE;
			velText.shadow = FlxG.BLACK;
			
			spikeText = new FlxText(0, 20, FlxG.width, "?");
			spikeText.size = 16;
			spikeText.color = FlxG.WHITE;
			spikeText.shadow = FlxG.BLACK;
			
			add(bg);
			add(player);
			add(spikeGroup);
			add(velText);
			add(spikeText);
		}
		
		override public function update():void 
		{
			super.update();
			
			FlxG.overlap(player, spikeGroup, ovPlayerSpikes);
			
			velText.text = "VEL: " + int(FOBJ.velocity.y).toString();
			spikeText.text = "SPIKES: " + spikeGroup.count;
			
			if (FlxG.keys.justPressed("ESCAPE")) {
				FlxG.switchState(new TestMenu());
			} else if (FlxG.keys.justPressed("ENTER")) {
				FlxG.resetState();
			}
		}
		
		private function ovPlayerSpikes(o1:FlxObject, o2:FlxObject):void
		{
			FOBJ.velocity.y = FOBJ.acceleration.y = 0;
			player.active = false;
		}
		
	}

}