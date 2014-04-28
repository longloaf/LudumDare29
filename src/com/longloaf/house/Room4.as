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
	public class Room4 extends Room
	{
		[Embed(source = "data/image/room4.png")]
		private static const BG:Class;
		
		private var r3Arr:Trigger;
		
		private var mainPoint:FlxPoint = new FlxPoint(400, 300);
		private var room3Point:FlxPoint = new FlxPoint(0, 300);
		
		public function Room4(h:HouseState) 
		{	
			super(h);
			
			var bg:FlxSprite = new FlxSprite(0, 0, BG);
			add(bg);
			
			var txt:FlxText = new FlxText(0, 0, FlxG.width, "Room 4");
			txt.alignment = "center";
			txt.size = 16;
			add(txt);
			
			r3Arr = new Trigger(houseState);
			r3Arr.loadGraphic(Assets.ARR_RIGHT, true, false, 100, 200);
			r3Arr.scale.x = -1;
			r3Arr.onClick = function():void
			{
				houseState.triggerFlagOff();
				player.gotoPoint(room3Point, gotoRoom3);
			};
			add(r3Arr);
			
			add(player);
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
		
	}

}