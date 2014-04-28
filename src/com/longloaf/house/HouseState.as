package com.longloaf.house 
{
	import com.longloaf.TestMenu;
	import org.flixel.FlxG;
	import org.flixel.FlxGroup;
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	import org.flixel.FlxText;
	/**
	 * ...
	 * @author Maksim Soldatov
	 */
	public class HouseState extends FlxState
	{
		
		public var room1:Room;
		public var room2:Room;
		public var room3:Room;
		public var room4:Room;
		
		private var currentRoom:Room;
		
		override public function create():void 
		{
			var txt:FlxText;
			
			room1 = new Room1(this);
			
			room2 = new Room2(this);
			
			room3 = new Room3(this);
			
			room4 = new Room4(this);
			
			currentRoom = room1;
			currentRoom.exists = true;
			
			add(room1);
			add(room2);
			add(room3);
			add(room4);
		}
		
		override public function update():void 
		{
			if (FlxG.keys.justPressed("ONE")) {
				switchRoom(room1);
			} else if (FlxG.keys.justPressed("TWO"))  {
				switchRoom(room2);
			} else if (FlxG.keys.justPressed("THREE")) {
				switchRoom(room3);
			} else if (FlxG.keys.justPressed("FOUR")) {
				switchRoom(room4);
			}
			
			super.update();
			
			if (FlxG.keys.justPressed("ESCAPE")) {
				FlxG.switchState(new TestMenu());
			} else if (FlxG.keys.justPressed("ENTER")) {
				FlxG.resetState();
			}
		}
		
		public function switchRoom(r:Room):void
		{
			currentRoom.exists = false;
			currentRoom = r;
			currentRoom.exists = true;
		}
		
	}

}