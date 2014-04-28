package com.longloaf.house 
{
	import com.longloaf.house.data.Assets;
	import org.flixel.FlxG;
	import org.flixel.FlxPoint;
	import org.flixel.FlxText;
	/**
	 * ...
	 * @author Maksim Soldatov
	 */
	public class Room1 extends Room
	{	
		private var r3Arr:Trigger;
		private var r2Arr:Trigger;
		
		private var mainPoint:FlxPoint = new FlxPoint(400, 300);
		private var room2Point:FlxPoint = new FlxPoint(800, 300);
		private var room3Point:FlxPoint = new FlxPoint(400, 200);
		private var initPoint:FlxPoint = new FlxPoint(0, 300);
		
		public function Room1(h:HouseState) 
		{
			super(h);
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
		}
		
		override public function init():void 
		{
			if (houseState.prevRoom == null) {
				player.move(initPoint);
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