package com.longloaf 
{
	import org.flixel.FlxGame;
	
	[SWF(width = "800", height = "600", backgroundColor = "#000000")]
	[Frame(factoryClass = "com.longloaf.Preloader")]
	
	/**
	 * ...
	 * @author Maksim Soldatov
	 */
	public class Main extends FlxGame
	{
		
		public static const DEBUG_MODE:Boolean = false;
		
		public function Main() 
		{
			super(800, 600, MenuState, 1, 30, 30, true);
			forceDebugger = DEBUG_MODE;
		}
		
	}

}