package com.longloaf 
{
	import com.longloaf.sound.Snd;
	import org.flixel.FlxG;
	import org.flixel.FlxSave;
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	/**
	 * ...
	 * @author Maksim Soldatov
	 */
	public class EndState extends FlxState
	{
		[Embed(source = "endState.png")]
		private static const Img:Class;
		
		override public function create():void 
		{
			var s:FlxSprite = new FlxSprite(0, 0, Img);
			add(s);
			
			FlxG.play(Snd.MUSHR);
			FlxG.flash();
		}
		
		override public function update():void 
		{
			super.update();
			if (FlxG.keys.justPressed("ENTER")) {
				FlxG.switchState(new MenuState());
			}
		}
		
	}

}