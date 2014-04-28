package com.longloaf.house 
{
	import com.longloaf.house.data.Assets;
	import org.flixel.FlxG;
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	import org.flixel.FlxText;
	/**
	 * ...
	 * @author Maksim Soldatov
	 */
	public class Room3 extends Room
	{
		[Embed(source = "data/image/room3.png")]
		private static const BG:Class;
		
		private var r1Arr:Trigger;
		private var r4Arr:Trigger;
		
		private var mainPoint:FlxPoint = new FlxPoint(490, 490);
		private var room1Point:FlxPoint = new FlxPoint(560, 600);
		private var room4Point:FlxPoint = new FlxPoint(660, 490);
		
		public function Room3(h:HouseState) 
		{
			super(h);
			
			var bg:FlxSprite = new FlxSprite(0, 0, BG);
			add(bg);
			
			var txt:FlxText = new FlxText(0, 0, FlxG.width, "Room 3");
			txt.alignment = "center";
			txt.size = 16;
			add(txt);
			
			r1Arr = new Trigger(houseState);
			r1Arr.loadGraphic(Assets.ARR_RIGHT, true, false, 100, 200);
			r1Arr.angle = 90;
			r1Arr.x = 400;
			r1Arr.y = 400;
			r1Arr.onClick = function():void
			{
				houseState.triggerFlagOff();
				player.gotoPoint(room1Point, gotoRoom1);
			};
			add(r1Arr);
			
			r4Arr = new Trigger(houseState);
			r4Arr.loadGraphic(Assets.ARR_RIGHT, true, false, 100, 200);
			r4Arr.x = 700;
			r4Arr.onClick = function():void
			{
				houseState.triggerFlagOff();
				player.gotoPoint(room4Point, gotoRoom4);
			};
			add(r4Arr);
			
			add(player);
		}
		
		override public function init():void 
		{
			if (houseState.prevRoom == houseState.room1) {
				player.move(room1Point);
			} else if (houseState.prevRoom == houseState.room4) {
				player.move(room4Point);
			} else {
				throw new Error();
			}
			
			player.gotoPoint(mainPoint, houseState.triggerFlagOn);
		}
		
		private function gotoRoom1():void
		{
			houseState.switchRoom(houseState.room1);
		}
		
		private function gotoRoom4():void
		{
			houseState.switchRoom(houseState.room4);
		}
		
	}

}