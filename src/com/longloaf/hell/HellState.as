package com.longloaf.hell 
{
	import com.longloaf.TestMenu;
	import org.flixel.FlxG;
	import org.flixel.FlxGroup;
	import org.flixel.FlxObject;
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
		
		private var objGroup:FlxGroup;
		
		private var bulletGroup:BulletGroup;
		
		override public function create():void 
		{
			tileMap = new FlxTilemap();
			tileMap.loadMap(new Map(), Tiles, TS, TS, FlxTilemap.OFF, 0, 0, 1);
			
			objGroup = new FlxGroup();
			
			bulletGroup = new BulletGroup();
			
			player = new Player();
			player.reset((tileMap.width - player.width) / 2, (tileMap.height - player.height) / 2);
			player.bulletGroup = bulletGroup;
			
			FlxG.camera.follow(player);
			tileMap.follow(FlxG.camera, 1);
			
			add(tileMap);
			add(objGroup);
			add(player);
			add(bulletGroup);
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
		
		private function ovBullet(o1:FlxObject, o2:FlxObject):void
		{
			o1.kill();
		}
		
	}

}