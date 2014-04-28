package com.longloaf.hell.data.image 
{
	import com.longloaf.hell.Player;
	import org.flixel.FlxObject;
	import org.flixel.FlxPath;
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author Maksim Soldatov
	 */
	public class Mushr extends FlxSprite
	{
		[Embed(source = "mushr.png")]
		private static const Img:Class;
		
		public var player:Player = null;
		
		private var target:FlxPoint = new FlxPoint();
		
		private var V:Number = 500;
		
		private var p:FlxPath;
		
		public function Mushr() 
		{
			loadGraphic(Img);
			
			p = new FlxPath();
			p.addPoint(target, true);
			
			followPath(p, V, PATH_LOOP_FORWARD);
		}
		
		override public function update():void 
		{
			player.getMidpoint(target);
		}
		
	}

}