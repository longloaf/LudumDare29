package com.longloaf.house 
{
	import org.flixel.FlxPath;
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author Maksim Soldatov
	 */
	public class Player extends FlxSprite
	{
		[Embed(source = "../hell/data/image/player_50x75_4.png")]
		private static const Img:Class;
		
		private var pathFlag:Boolean = false;
		
		private var playerPath:FlxPath = new FlxPath();
		
		private var target:FlxPoint = new FlxPoint();
		
		private var pathFinish:Function = null;
		
		private const VEL:Number = 200;
		
		public function Player() 
		{
			loadGraphic(Img, true, true, 50, 75);
			addAnimation("idle", [0, 1], 3);
			addAnimation("move", [2, 3], 3);
			play("idle");
			
			playerPath.addPoint(target, true);
		}
		
		public function gotoPoint(p:FlxPoint, onFinish:Function):void
		{
			target.copyFrom(p);
			followPath(playerPath, VEL);
			pathFinish = onFinish;
			pathFlag = true;
		}
		
		public function move(p:FlxPoint):void
		{
			x = p.x - width / 2;
			y = p.y - height / 2;
		}
		
		public function jump():void
		{
			acceleration.y = 2000;
			velocity.x = 300;
			velocity.y = -600;
		}
		
		override public function update():void 
		{
			if (pathFlag && (pathSpeed == 0)) {
				pathFlag = false;
				if (pathFinish != null) {
					pathFinish();
				}
			}
			
			if (velocity.x != 0) {
				play("move");
				facing = velocity.x > 0 ? RIGHT : LEFT;
			} else {
				play("idle");
			}
		}
		
	}

}