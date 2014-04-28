package com.longloaf.house 
{
	import com.longloaf.hole.HoleState;
	import com.longloaf.house.data.Assets;
	import org.flixel.FlxG;
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	import org.flixel.FlxText;
	/**
	 * ...
	 * @author Maksim Soldatov
	 */
	public class Room4 extends Room
	{
		[Embed(source = "data/image/room4.png")]
		private static const BG:Class;
		
		[Embed(source = "data/image/room4_2.png")]
		private static const BG2:Class;
		
		private var rightTrigger:RightTrigger;
		
		private var mainPoint:FlxPoint = new FlxPoint(240, 490);
		private var room3Point:FlxPoint = new FlxPoint(120, 490);
		
		private var holeTrigger:HoleTrigger;
		
		public function Room4(h:HouseState) 
		{	
			super(h);
			
			var bg:FlxSprite = new FlxSprite(0, 0, BG);
			add(bg);
			
			/*
			var txt:FlxText = new FlxText(0, 0, FlxG.width, "Room 4");
			txt.alignment = "center";
			txt.size = 16;
			add(txt);
			*/
			
			rightTrigger = new RightTrigger(h);
			rightTrigger.scale.x = -1;
			rightTrigger.x = 89;
			rightTrigger.y = 284;
			rightTrigger.onClick = function():void
			{
				houseState.triggerFlagOff();
				player.gotoPoint(room3Point, gotoRoom3);
			};
			add(rightTrigger);
			
			holeTrigger = new HoleTrigger(h);
			holeTrigger.onClick = function():void
			{
				houseState.triggerFlagOff();
				player.jump();
			};
			add(holeTrigger);
			
			add(player);
			
			var s:FlxSprite = new FlxSprite(0, 0, BG2);
			s.x = FlxG.width - s.width;
			s.y = FlxG.height - s.height;
			add(s);
		}
		
		override public function init():void 
		{
			player.move(room3Point);
			player.gotoPoint(mainPoint, houseState.triggerFlagOn);
		}
		
		private function gotoRoom3():void
		{
			houseState.switchRoom(houseState.room3);
		}
		
		override public function update():void 
		{
			super.update();
			if (player.exists && (player.acceleration.y != 0) && (player.y > FlxG.width)) {
				FlxG.fade(FlxG.BLACK, 1, function():void
				{
					FlxG.switchState(new HoleState());
				});
			}
		}
		
	}

}