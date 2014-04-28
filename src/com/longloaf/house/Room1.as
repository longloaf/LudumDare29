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
		
		private var r3Arr:Trigger;
		private var r2Arr:Trigger;
		
		private var mainPoint:FlxPoint = new FlxPoint(420, 500);
		private var room2Point:FlxPoint = new FlxPoint(670, 430);
		private var room3Point:FlxPoint = new FlxPoint(330, 430);
		private var initPoint:FlxPoint = new FlxPoint(0, 500);
		
		public var mat:Mat;
		public var matTrigger:MatTrigger;
		public var key1Trigger:Key1Trigger;
		public var door1Trigger:DoorTrigger;
		public var openedDoor1Trigger:OpenedDoorTrigger;
		
		public function Room1(h:HouseState) 
		{
			super(h);
			
			var bg:FlxSprite = new FlxSprite(0, 0, BG);
			add(bg);
			
			mat = new Mat();
			mat.exists = false;
			add(mat);
			
			matTrigger = new MatTrigger(h);
			add(matTrigger);
			
			key1Trigger = new Key1Trigger(h);
			key1Trigger.exists = false;
			add(key1Trigger);
			
			openedDoor1Trigger = new OpenedDoorTrigger(h);
			openedDoor1Trigger.exists = false;
			add(openedDoor1Trigger);
			
			door1Trigger = new DoorTrigger(h);
			door1Trigger.item = HouseState.KEY1_ITEM;
			door1Trigger.openedDoorTrigger = openedDoor1Trigger;
			add(door1Trigger);
			
			var txt:FlxText = new FlxText(0, 0, FlxG.width, "Room 1");
			txt.alignment = "center";
			txt.size = 16;
			add(txt);
			
			r3Arr = new Trigger(houseState);
			r3Arr.loadGraphic(Assets.ARR_RIGHT, true, false, 100, 200);
			r3Arr.angle = -90;
			r3Arr.x = 400;
			r3Arr.onClick = function():void
			{
				houseState.triggerFlagOff();
				player.gotoPoint(room3Point, gotoRoom3);
			};
			add(r3Arr);
			
			r2Arr = new Trigger(houseState);
			r2Arr.loadGraphic(Assets.ARR_RIGHT, true, false, 100, 200);
			r2Arr.x = 700;
			r2Arr.onClick = function():void
			{
				houseState.triggerFlagOff();
				player.gotoPoint(room2Point, gotoRoom2);
			};
			add(r2Arr);
			
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