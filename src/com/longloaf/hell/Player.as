package com.longloaf.hell 
{
	import org.flixel.FlxG;
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	import org.flixel.FlxU;
	/**
	 * ...
	 * @author Maksim Soldatov
	 */
	public class Player extends FlxSprite
	{
		
		private static const ACC:Number = 700;
		
		private var midp:FlxPoint = new FlxPoint();
		
		public var bulletGroup:BulletGroup = null;
		private const BT:Number = 0.5;
		private var bt:Number = 0;
		
		public function Player() 
		{
			makeGraphic(50, 50, FlxU.makeColorFromHSB(100, 0.7, 0.7));
			
			maxVelocity.x = maxVelocity.y = 300;
			drag.x = drag.y = ACC;
		}
		
		override public function update():void 
		{
			acceleration.make();
			
			if (FlxG.keys.LEFT || FlxG.keys.A) {
				acceleration.x -= ACC;
			}
			if (FlxG.keys.RIGHT || FlxG.keys.D) {
				acceleration.x += ACC;
			}
			
			if (FlxG.keys.UP || FlxG.keys.W) {
				acceleration.y -= ACC;
			}
			if (FlxG.keys.DOWN || FlxG.keys.S) {
				acceleration.y += ACC;
			}
			
			getMidpoint(midp);
			
			updateBullets();
		}
		
		private function updateBullets():void
		{
			if (bulletGroup == null) {
				return;
			}
			
			if (bt > 0) {
				bt -= FlxG.elapsed;
			}
			if (FlxG.mouse.pressed()) {
				if (bt <= 0) {
					bulletGroup.makeBullet(midp, FlxG.mouse);
					bt += BT;
				}
			}
		}
		
	}

}