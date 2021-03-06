package com.longloaf.hole 
{
	import org.flixel.FlxG;
	import org.flixel.FlxGroup;
	/**
	 * ...
	 * @author Maksim Soldatov
	 */
	public class Bg extends FlxGroup
	{
		private var last:BgSpr;
		
		public function Bg()
		{
			var y:Number = 0;
			while (y <= 2 * FlxG.height) {
				last = new BgSpr();
				last.x = 200;
				last.y = y;
				add(last);
				y = last.y + last.height;
			}
		}
		
		override public function update():void 
		{
			if (last.y <= FlxG.height) {
				var tmp:BgSpr = recycle(BgSpr) as BgSpr;
				tmp.reset(200, last.y + last.height);
				last = tmp;
			}
			super.update();
			
		}
		
	}

}