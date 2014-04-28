package com.longloaf.hell 
{
	import com.longloaf.sound.Snd;
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author Maksim Soldatov
	 */
	public class Enemy extends FlxSprite
	{
		public var enemyHealth:int = 1;
		public var currentHealth:int;
		
		override public function reset(X:Number, Y:Number):void 
		{
			super.reset(X, Y);
			currentHealth = enemyHealth;
		}
		
		public function hit():void
		{
			--currentHealth;
			if (currentHealth <= 0) {
				kill();
				FlxG.play(Snd.DEATH01);
			} else {
				FlxG.play(Snd.SHOT03);
			}
		}
		
	}

}