package com.longloaf.house 
{
	import org.flixel.FlxGroup;
	/**
	 * ...
	 * @author Maksim Soldatov
	 */
	public class Room extends FlxGroup
	{
		protected var houseState:HouseState;
		
		protected var player:Player;
		
		public function Room(h:HouseState) 
		{
			houseState = h;
			exists = false;
			
			player = new Player();
		}
		
		public function init():void
		{
			
		}
		
	}

}