package com.longloaf.hell 
{
	import org.flixel.FlxGroup;
	import org.flixel.FlxPoint;
	import org.flixel.FlxU;
	/**
	 * ...
	 * @author Maksim Soldatov
	 */
	public class BulletGroup extends FlxGroup
	{
		
		public function makeBullet(p1:FlxPoint, p2:FlxPoint):void
		{
			var b:Bullet = recycle(Bullet) as Bullet;
			b.reset(p1.x - b.width / 2, p1.y - b.height / 2);
			var ang:Number = Math.atan2(p2.y - p1.y, p2.x - p1.x);
			b.velocity.make(Bullet.V * Math.cos(ang), Bullet.V * Math.sin(ang));
		}
		
	}

}