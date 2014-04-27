package com.longloaf.hell 
{
	import org.flixel.FlxG;
	import org.flixel.FlxObject;
	import org.flixel.FlxPath;
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	import org.flixel.FlxTilemap;
	/**
	 * ...
	 * @author Maksim Soldatov
	 */
	public class Enemy01 extends FlxSprite
	{
		
		public var map:FlxTilemap = null;
		
		private var target:FlxPoint = new FlxPoint();
		
		private const V:Number = 50;
		
		private var p:FlxPath;
		
		public function Enemy01() 
		{
			makeGraphic(50, 50, 0xFF900000);
			
			p = new FlxPath();
			p.addPoint(target, true);
		}
		
		override public function reset(X:Number, Y:Number):void 
		{
			super.reset(X, Y);
			newTarget();
		}
		
		override public function update():void 
		{
			if (pathSpeed == 0) {
				newTarget();
			}
		}
		
		private function newTarget():void
		{
			//target.x = 2 * HellState.TS + FlxG.random() * (map.width - 4 * HellState.TS);
			//target.y = 2 * HellState.TS + FlxG.random() * (map.height - 4 * HellState.TS);
			
			target.x = 2 * HellState.TS + FlxG.random() * (800 - 4 * HellState.TS);
			target.y = 2 * HellState.TS + FlxG.random() * (600 - 4 * HellState.TS);
			
			followPath(p, V);
		}
		
	}

}