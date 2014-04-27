package com.longloaf 
{
	import com.longloaf.hole.HoleState;
	import org.flixel.FlxButton;
	import org.flixel.FlxG;
	import org.flixel.FlxState;
	/**
	 * ...
	 * @author Maksim Soldatov
	 */
	public class TestMenu extends FlxState
	{	
		override public function create():void 
		{
			var holeButton:FlxButton = new FlxButton(50, 50, "Hole", gotoHole);
			add(holeButton);
		}
		
		private function gotoHole():void
		{
			FlxG.switchState(new HoleState());
		}
		
	}

}