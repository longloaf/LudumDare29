package com.longloaf.hell 
{
	import com.longloaf.TestMenu;
	import org.flixel.FlxG;
	import org.flixel.FlxState;
	import org.flixel.FlxTilemap;
	/**
	 * ...
	 * @author Maksim Soldatov
	 */
	public class HellState extends FlxState
	{
		[Embed(source = "tiles_100x100_2.png")]
		private static const Tiles:Class;
		
		[Embed(source = "map.txt", mimeType = "application/octet-stream")]
		private static const Map:Class;
		
		public static const TS:Number = 50;
		
		private var tileMap:FlxTilemap;
		
		private var player:Player;
		
		override public function create():void 
		{
			tileMap = new FlxTilemap();
			tileMap.loadMap(new Map(), Tiles, TS, TS, FlxTilemap.OFF, 0, 0, 1);
			
			player = new Player();
			player.reset(6 * TS, 6 * TS);
			
			FlxG.camera.follow(player);
			tileMap.follow();
			
			add(tileMap);
			add(player);
		}
		
		override public function update():void 
		{
			super.update();
			
			FlxG.collide(player, tileMap);
			
			if (FlxG.keys.justPressed("ESCAPE")) {
				FlxG.switchState(new TestMenu());
			} else if (FlxG.keys.justPressed("ENTER")) {
				FlxG.resetState();
			}
		}
		
	}

}