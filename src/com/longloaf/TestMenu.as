package com.longloaf 
{
	import com.longloaf.hell.HellState;
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
			var holeButton:FlxButton = new FlxButton(50, 100, "Hole", gotoHole);
			add(holeButton);
			
			var hellButton:FlxButton = new FlxButton(50, 130, "Hell", gotoHell);
			add(hellButton);
		}
		
		private function gotoHole():void
		{
			FlxG.switchState(new HoleState());
		}
		
		private function gotoHell():void
		{
			FlxG.switchState(new HellState());
		}
		
	}

}