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
	public class Room1 extends Room
	{
		[Embed(source = "data/image/room1.png")]
		private static const BG:Class;
		
		private var mainPoint:FlxPoint = new FlxPoint(420, 500);
		private var room2Point:FlxPoint = new FlxPoint(330, 430);
		private var room3Point:FlxPoint = new FlxPoint(670, 430);
		private var initPoint:FlxPoint = new FlxPoint(0, 500);
		
		public var mat:Mat;
		public var matTrigger:MatTrigger;
		public var key1Trigger:Key1Trigger;
		public var door1Trigger:DoorTrigger;
		public var openedDoor1Trigger:OpenedDoorTrigger;
		public var door2Trigger:DoorTrigger;
		public var openedDoor2Trigger:OpenedDoorTrigger;
		
		public function Room1(h:HouseState) 
		{
			super(h);
			
			var bg:FlxSprite = new FlxSprite(0, 0, BG);
			add(bg);
			
			mat = new Mat();
			mat.exists = false;
			add(mat);
			
			key1Trigger = new Key1Trigger(h);
			key1Trigger.exists = false;
			add(key1Trigger);
			
			matTrigger = new MatTrigger(h);
			add(matTrigger);
			
			openedDoor1Trigger = new OpenedDoorTrigger(h);
			openedDoor1Trigger.x = 638;
			openedDoor1Trigger.y = 317;
			openedDoor1Trigger.onClick = function():void
			{
				houseState.triggerFlagOff();
				player.gotoPoint(room3Point, gotoRoom3);
			};
			openedDoor1Trigger.exists = false;
			add(openedDoor1Trigger);
			
			door1Trigger = new DoorTrigger(h);
			door1Trigger.x = openedDoor1Trigger.x;
			door1Trigger.y = openedDoor1Trigger.y;
			door1Trigger.item = HouseState.KEY1_ITEM;
			door1Trigger.openedDoorTrigger = openedDoor1Trigger;
			add(door1Trigger);
			
			openedDoor2Trigger = new OpenedDoorTrigger(h);
			openedDoor2Trigger.x = 297;
			openedDoor2Trigger.y = 317;
			openedDoor2Trigger.onClick = function():void
			{
				houseState.triggerFlagOff();
				player.gotoPoint(room2Point, gotoRoom2);
			};
			openedDoor2Trigger.exists = false;
			add(openedDoor2Trigger);
			
			door2Trigger = new DoorTrigger(h);
			door2Trigger.x = openedDoor2Trigger.x;
			door2Trigger.y = openedDoor2Trigger.y;
			door2Trigger.item = HouseState.KEY2_ITEM;
			door2Trigger.openedDoorTrigger = openedDoor2Trigger;
			add(door2Trigger);
			
			/*
			var txt:FlxText = new FlxText(0, 0, FlxG.width, "Room 1");
			txt.alignment = "center";
			txt.size = 16;
			add(txt);
			*/
			
			add(player);
		}
		
		override public function init():void 
		{
			if (houseState.prevRoom == null) {
				player.move(initPoint);
			} else if (houseState.prevRoom == houseState.room2) {
				player.move(room2Point);
			} else if (houseState.prevRoom == houseState.room3)  {
				player.move(room3Point);
			} else {
				throw new Error();
			}
			
			player.gotoPoint(mainPoint, houseState.triggerFlagOn);
		}
		
		private function gotoRoom3():void
		{
			houseState.switchRoom(houseState.room3);
		}
		
		private function gotoRoom2():void
		{
			houseState.switchRoom(houseState.room2);
		}
		
	}

}