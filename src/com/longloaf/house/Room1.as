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
		private var r2Arr:Trigger;
		private var r3Arr:Trigger;
		
		private var mainPoint:FlxPoint = new FlxPoint(400, 300);
		private var room2Point:FlxPoint = new FlxPoint(800, 300);
		private var room3Point:FlxPoint = new FlxPoint(400, 200);
		private var initPoint:FlxPoint = new FlxPoint(0, 300);
		
		private var firstTime:Boolean = true;
		
		public function Room1(h:HouseState) 
		{
			super(h);
			var txt:FlxText = new FlxText(0, 0, FlxG.width, "Room 1");
			txt.alignment = "center";
			txt.size = 16;
			add(txt);
			
			r2Arr = new Trigger(houseState);
			r2Arr.loadGraphic(Assets.ARR_RIGHT, true, false, 100, 200);
			r2Arr.onClick = function():void { houseState.switchRoom(houseState.room2); };
			add(r2Arr);
			
			r2Arr = new Trigger(houseState);
		}
		
		override public function init():void 
		{
			houseState.triggerFlagOff();
			
			if (firstTime) {
				firstTime = false;
				player.move(initPoint);
			} else {
				player.move(room2Point);
			}
			
			player.gotoPoint(mainPoint, houseState.triggerFlagOn);
		}
		
		private function gotoRoom2():void
		{
			houseState.switchRoom(houseState.room2);
		}
		
		private function gotoRoom3():void
		{
			houseState.switchRoom(houseState.room3);
		}
		
	}

}