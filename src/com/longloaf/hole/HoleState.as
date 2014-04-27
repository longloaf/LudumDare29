package com.longloaf.hole 
{
	import com.longloaf.TestMenu;
	import org.flixel.FlxG;
	import org.flixel.FlxGroup;
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
		
		private var bg:Bg;
		
		private var player:Player;
		
		private var spikeGroup:SpikeGroup;
		
		override public function create():void 
		{
			FOBJ = new FlxSprite();
			FOBJ.reset(0, FlxG.height);
			FOBJ.velocity.y = 50;
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
			
			add(bg);
			add(player);
			add(spikeGroup);
			add(velText);
		}
		
		override public function update():void 
		{
			/*
			if (FlxG.keys.justPressed("ONE")) {
				makeSpikes1();
			} else if (FlxG.keys.justPressed("TWO")) {
				makeSpikes2();
			}
			*/
			
			super.update();
			
			velText.text = int(FOBJ.velocity.y).toString();
			
			if (FlxG.keys.justPressed("ESCAPE")) {
				FlxG.switchState(new TestMenu());
			}
		}
		
	}

}