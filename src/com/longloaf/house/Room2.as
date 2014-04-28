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
	public class Room2 extends Room
	{
		[Embed(source = "data/image/room2.png")]
		private static const BG:Class;
		
		private var r1Arr:Trigger;
		
		private var mainPoint:FlxPoint = new FlxPoint(400, 300);
		private var room1Point:FlxPoint = new FlxPoint(0, 300);
		
		public function Room2(h:HouseState) 
		{
			super(h);
			
			var bg:FlxSprite = new FlxSprite(0, 0, BG);
			add(bg);
			
			var txt:FlxText = new FlxText(0, 0, FlxG.width, "Room 2");
			txt.alignment = "center";
			txt.size = 16;
			add(txt);
			
			r1Arr = new Trigger(houseState);
			r1Arr.loadGraphic(Assets.ARR_RIGHT, true, false, 100, 200);
			r1Arr.angle = 90;
			r1Arr.y = 400;
			r1Arr.onClick = function():void
			{
				houseState.triggerFlagOff();
				player.gotoPoint(room1Point, gotoRoom1);
			};
			add(r1Arr);
			
			add(player);
		}
		
		override public function init():void 
		{
			player.move(room1Point);
			player.gotoPoint(mainPoint, houseState.triggerFlagOn);
		}
		
		private function gotoRoom1():void
		{
			houseState.switchRoom(houseState.room1);
		}
		
	}

}