package com.longloaf.hell 
{
	import org.flixel.FlxG;
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author Maksim Soldatov
	 */
	public class Enemy01 extends FlxSprite
	{
		
		public var c:FlxPoint = new FlxPoint();
		public var r:Number = 0;
		
		private var target:FlxPoint = new FlxPoint();
		
		public function Enemy01() 
		{
			makeGraphic(50, 50, 0xFF900000);
		}
		
		override public function reset(X:Number, Y:Number):void 
		{
			super.reset(X, Y);
		}
		
		override public function update():void 
		{
			
		}
		
		private function newTarget():void
		{
			target.copyFrom(c);
			var ang:Number = 2 * Math.PI * FlxG.random();
			var d:Number = r * FlxG.random();
			target.x += d * Math.cos(ang);
			target.y += d * Math.sin(ang);
		}
		
	}

}