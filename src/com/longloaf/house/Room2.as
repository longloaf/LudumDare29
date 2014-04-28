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
	public class Room2 extends Room
	{
		[Embed(source = "data/image/room2.png")]
		private static const BG:Class;
		
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
		}
		
		override public function init():void 
		{
			
			
		}
		
	}

}