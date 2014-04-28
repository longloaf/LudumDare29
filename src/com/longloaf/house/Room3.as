package com.longloaf.house 
{
	import org.flixel.FlxG;
	import org.flixel.FlxText;
	/**
	 * ...
	 * @author Maksim Soldatov
	 */
	public class Room3 extends Room
	{
		
		public function Room3(h:HouseState) 
		{
			super(h);
			var txt:FlxText = new FlxText(0, 0, FlxG.width, "Room 3");
			txt.alignment = "center";
			txt.size = 16;
			add(txt);
		}
		
	}

}