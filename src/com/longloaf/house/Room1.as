package com.longloaf.house 
{
	import com.longloaf.house.data.Assets;
	import org.flixel.FlxG;
	import org.flixel.FlxText;
	/**
	 * ...
	 * @author Maksim Soldatov
	 */
	public class Room1 extends Room
	{	
		private var r2Arr:Trigger;
		private var r3Arr:Trigger;
		
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
		
	}

}