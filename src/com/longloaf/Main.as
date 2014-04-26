package com.longloaf 
{
	import org.flixel.FlxGame;
	
	[SWF(width = "800", height = "544", backgroundColor = "#000000")]
	[Frame(factoryClass = "com.longloaf.Preloader")]
	
	/**
	 * ...
	 * @author Maksim Soldatov
	 */
	public class Main extends FlxGame
	{
		
		public function Main() 
		{
			super(800, 600, PlayState, 1, 30, 30, true);
			forceDebugger = true;
		}
		
	}

}