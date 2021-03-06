package com.longloaf.house 
{
	import com.longloaf.hole.HoleState;
	import com.longloaf.HouseControls;
	import com.longloaf.Main;
	import com.longloaf.MenuState;
	import com.longloaf.sound.Snd;
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
		
		public var triggerFlag:Boolean = false;
		//private var triggerText:FlxText;
		
		public var room1:Room1;
		public var room2:Room2;
		public var room3:Room3;
		public var room4:Room4;
		
		public var prevRoom:Room;
		public var currentRoom:Room;
		
		//private var mouseText:FlxText;
		
		public static const NO_ITEM:int = 0;
		public static const KEY1_ITEM:int = 1;
		public static const KEY2_ITEM:int = 2;
		public static const CROWBAR_ITEM:int = 3;
		public var item:int = NO_ITEM;
		
		private var itemSpr:Items;
		
		override public function create():void 
		{
			var txt:FlxText;
			
			room1 = new Room1(this);
			
			room2 = new Room2(this);
			
			room3 = new Room3(this);
			
			room4 = new Room4(this);
			
			prevRoom = null;
			
			currentRoom = room1;
			currentRoom.init();
			currentRoom.exists = true;
			
			add(room1);
			add(room2);
			add(room3);
			add(room4);
			
			itemSpr = new Items(this);
			add(itemSpr);
			
			/*
			triggerText = new FlxText(0, 0, FlxG.width, "?");
			triggerText.size = 16;
			triggerText.y = (FlxG.height - triggerText.height);
			add(triggerText);
			
			mouseText = new FlxText(0, 0, FlxG.width, "?");
			mouseText.size = 16;
			mouseText.y = triggerText.y - 20;
			add(mouseText);
			*/
			
			add(new HouseControls());
			
			FlxG.play(Snd.MUSHR);
			FlxG.flash(FlxG.BLACK);
		}
		
		override public function update():void 
		{
			if (FlxG.keys.justPressed("ONE")) {
				switchRoom(room1);
			} else if (FlxG.keys.justPressed("TWO")) {
				switchRoom(room2);
			} else if (FlxG.keys.justPressed("THREE")) {
				switchRoom(room3);
			} else if (FlxG.keys.justPressed("FOUR")) {
				switchRoom(room4);
			}
			
			if (FlxG.keys.justPressed("T")) {
				triggerFlag = !triggerFlag;
			}
			
			super.update();
			
			//triggerText.text = "TRIGGERS: " + triggerFlag;
			//mouseText.text = FlxG.mouse.x + "x" + FlxG.mouse.y;
			
			if (FlxG.keys.justPressed("ESCAPE")) {
				FlxG.switchState(new MenuState());
			} else if (Main.DEBUG_MODE) {
				if (FlxG.keys.justPressed("ENTER")) {
					FlxG.resetState();
				} else if (FlxG.keys.justPressed("N")) {
					FlxG.switchState(new HoleState());
				}
			}
		}
		
		public function switchRoom(r:Room):void
		{
			prevRoom = currentRoom;
			prevRoom.exists = false;
			
			currentRoom = r;
			currentRoom.init();
			currentRoom.exists = true;
		}
		
		public function switchTriggerFlag():void
		{
			triggerFlag = !triggerFlag;
		}
		
		public function triggerFlagOn():void
		{
			triggerFlag = true;
		}
		
		public function triggerFlagOff():void
		{
			triggerFlag = false;
		}
		
	}

}