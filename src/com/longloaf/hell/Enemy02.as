package com.longloaf.hell 
{
	import com.longloaf.hell.Enemy;
	import com.longloaf.util.R;
	import org.flixel.FlxG;
	import org.flixel.FlxPath;
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author Maksim Soldatov
	 */
	public class Enemy02 extends Enemy
	{
		[Embed(source = "data/image/enemy02_100x100_3.png")]
		private static const Img:Class;
		
		public var player:Player = null;
		
		private var target:FlxPoint = new FlxPoint();
		
		private var V:Number = 50;
		
		private var p:FlxPath;
		
		private var T:Number = 2;
		private var t:Number = 0;
		
		public function Enemy02() 
		{
			//makeGraphic(50, 50, 0xFF905000);
			loadGraphic(Img, true, true, 100, 100);
			width = height = 50;
			centerOffsets();
			addAnimation("1", [0, 1, 0, 2], 5);
			play("1");
			
			p = new FlxPath();
			p.addPoint(target, true);
			
			enemyHealth = 3;
		}
		
		override public function reset(X:Number, Y:Number):void 
		{
			super.reset(X, Y);
			T = R.range(1, 5);
			V = R.range(50, 100);
			newTarget();
		}
		
		override public function update():void 
		{
			t += FlxG.elapsed;
			if ((t > T) || (pathSpeed == 0)) {
				newTarget();
			}
			
			facing = velocity.x >= 0 ? RIGHT : LEFT;
		}
		
		private function newTarget():void
		{
			player.getMidpoint(target);
			
			followPath(p, V);
			
			t = 0;
		}
		
	}

}