package com.longloaf.hell 
{
	import com.longloaf.Enemy;
	import com.longloaf.Main;
	import com.longloaf.MenuState;
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
		
		[Embed(source = "map_16x12.txt", mimeType = "application/octet-stream")]
		private static const Map2:Class;
		
		public static const TS:Number = 50;
		
		private var tileMap:FlxTilemap;
		
		private var player:Player;
		
		private var enemyGroup:EnemyGroup;
		
		private var bulletGroup:BulletGroup;
		
		override public function create():void 
		{
			tileMap = new FlxTilemap();
			tileMap.loadMap(new Map2(), Tiles, TS, TS, FlxTilemap.OFF, 0, 0, 1);
			
			bulletGroup = new BulletGroup();
			
			player = new Player();
			player.reset((tileMap.width - player.width) / 2, (tileMap.height - player.height) / 2);
			player.bulletGroup = bulletGroup;
			
			enemyGroup = new EnemyGroup();
			enemyGroup.add(player);
			
			FlxG.camera.follow(player);
			//tileMap.follow(FlxG.camera, 1);
			//
			
			add(tileMap);
			add(enemyGroup);
			add(bulletGroup);
			
			FlxG.flash(FlxG.BLACK);
		}
		
		override public function update():void 
		{
			if (FlxG.keys.justPressed("ONE")) {
				var e01:Enemy01 = enemyGroup.recycle(Enemy01) as Enemy01;
				e01.map = tileMap;
				e01.reset(FlxG.mouse.x, FlxG.mouse.y);
			}  else if (FlxG.keys.justPressed("TWO")) {
				var e02:Enemy02 = enemyGroup.recycle(Enemy02) as Enemy02;
				e02.player = player;
				e02.reset(FlxG.mouse.x, FlxG.mouse.y);
			}
			super.update();
			
			FlxG.collide(player, tileMap);
			FlxG.overlap(bulletGroup, enemyGroup, ovBulletEnemy);
			
			enemyGroup.sort();
			
			if (FlxG.keys.justPressed("ESCAPE")) {
				FlxG.switchState(new MenuState());
			} else if (Main.DEBUG_MODE) {
				if (FlxG.keys.justPressed("ENTER")) {
					FlxG.resetState();
				}
			}
		}
		
		private function ovBulletEnemy(o1:FlxObject, o2:FlxObject):void
		{
			if (o2 is Enemy) {
				o1.kill();
				(o2 as Enemy).hit();
			}
		}
		
	}

}