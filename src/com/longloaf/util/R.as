package com.longloaf.util 
{
	import org.flixel.FlxG;
	/**
	 * ...
	 * @author Maksim Soldatov
	 */
	public class R 
	{
		
		public static function range(min:Number, max:Number):Number
		{
			return min + (max - min) * FlxG.random();
		}
		
	}

}