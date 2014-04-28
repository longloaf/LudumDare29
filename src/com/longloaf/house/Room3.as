package com.longloaf.house 
{
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
		
		private var downTrigger:DownTrigger;
		public var rightTrigger:RightTrigger;
		
		private var mainPoint:FlxPoint = new FlxPoint(490, 490);
		private var room1Point:FlxPoint = new FlxPoint(560, 600);
		private var room4Point:FlxPoint = new FlxPoint(660, 490);
		
		public var key2Trigger:Key2Trigger;
		
		private var boardsTrigger:BoardsTrigger;
		
		public function Room3(h:HouseState) 
		{
			super(h);
			
			var bg:FlxSprite = new FlxSprite(0, 0, BG);
			add(bg);
			
			key2Trigger = new Key2Trigger(h);
			add(key2Trigger);
			
			/*
			var txt:FlxText = new FlxText(0, 0, FlxG.width, "Room 3");
			txt.alignment = "center";
			txt.size = 16;
			add(txt);
			*/
			
			downTrigger = new DownTrigger(h);
			downTrigger.onClick = function():void
			{
				houseState.triggerFlagOff();
				player.gotoPoint(room1Point, gotoRoom1);
			};
			add(downTrigger);
			
			rightTrigger = new RightTrigger(h);
			rightTrigger.x = 641;
			rightTrigger.y = 284;
			rightTrigger.onClick = function():void
			{
				houseState.triggerFlagOff();
				player.gotoPoint(room4Point, gotoRoom4);
			};
			rightTrigger.exists = false;
			add(rightTrigger);
			
			boardsTrigger = new BoardsTrigger(h);
			add(boardsTrigger);
			
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