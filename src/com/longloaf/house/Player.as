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
		private var pathFlag:Boolean = false;
		
		private var playerPath:FlxPath = new FlxPath();
		
		private var target:FlxPoint = new FlxPoint();
		
		private var pathFinish:Function = null;
		
		private const VEL:Number = 200;
		
		public function Player() 
		{
			makeGraphic(50, 50, 0xFF000090);
			
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
		}
		
	}

}