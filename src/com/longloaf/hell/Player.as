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
		[Embed(source = "data/image/player_50x75_4.png")]
		private static const Img:Class;
		
		private const ACC:Number = 1000;
		
		private const V1:Number = 30;
		private const V2:Number = 300;
		
		private var midp:FlxPoint = new FlxPoint();
		
		public var bulletGroup:BulletGroup = null;
		private const BT:Number = 0.2;
		private var bt:Number = 0;
		
		public function Player() 
		{
			//makeGraphic(50, 50, FlxU.makeColorFromHSB(100, 0.7, 0.7));
			loadGraphic(Img, true, true, 50, 75);
			height = 50;
			offset.y = 25;
			addAnimation("idle", [0, 1], 3);
			addAnimation("move", [2, 3], 3);
			
			maxVelocity.make(V2, V2);
			drag.make(ACC, ACC);
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
			
			if ((acceleration.x != 0) && (acceleration.y != 0)) {
				play("move");
			} else {
				play("idle");
			}
			
			getMidpoint(midp);
			
			updateBullets();
			//if (bt > 0) {
			if (FlxG.mouse.pressed()) {
				maxVelocity.make(V1, V1);
			} else {
				maxVelocity.make(V2, V2);
			}
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