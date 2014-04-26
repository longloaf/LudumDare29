package com.longloaf 
{
	import org.flixel.system.FlxPreloader;
	/**
	 * ...
	 * @author Maksim Soldatov
	 */
	public class Preloader extends FlxPreloader
	{
		
		public function Preloader() 
		{
			minDisplayTime = 3;
			className = "com.longloaf.Main";
		}
		
	}

}