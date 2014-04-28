package com.longloaf.house 
{
	import org.flixel.FlxG;
	import org.flixel.FlxText;
	/**
	 * ...
	 * @author Maksim Soldatov
	 */
	public class Room4 extends Room
	{
		
		public function Room4(h:HouseState) 
		{
			super(h);
			var txt:FlxText = new FlxText(0, 0, FlxG.width, "Room 4");
			txt.alignment = "center";
			txt.size = 16;
			add(txt);
		}
		
	}

}