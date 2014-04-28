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
		
		public function Room(h:HouseState) 
		{
			houseState = h;
			exists = false;
		}
		
		public function init():void
		{
			
		}
		
	}

}