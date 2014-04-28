package com.longloaf.hell 
{
	import com.longloaf.hell.data.image.Mushr;
	import com.longloaf.hell.Enemy;
	import com.longloaf.Main;
	import com.longloaf.MenuState;
	import com.longloaf.sound.Snd;
	import org.flixel.FlxG;
	import org.flixel.FlxGroup;
	import org.flixel.FlxObject;
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	import org.flixel.FlxTilemap;
	/**
	 * ...
	 * @author Maksim Soldatov
	 */
	public class HellState extends FlxState
	{
		[Embed(source = "data/image/tiles_50x50_4.png")]
		private static const Tiles:Class;
		
		[Embed(source = "map_24x18.txt", mimeType = "application/octet-stream")]
		private static const Map:Class;
		
		[Embed(source = "data/image/players.png")]
		private static const DeadPlayers:Class;
		
		public static const TS:Number = 50;
		
		private var tileMap:FlxTilemap;
		
		private var player:Player;
		
		private var enemyGroup:EnemyGroup;
		
		private var bulletGroup:BulletGroup;
		
		override public function create():void 
		{
			tileMap = new FlxTilemap();
			tileMap.loadMap(new Map(), Tiles, TS, TS, FlxTilemap.OFF, 0, 0, 3);
			
			var deadPlayers:FlxSprite = new FlxSprite(0, 0, DeadPlayers);
			deadPlayers.x = (tileMap.width - deadPlayers.width) / 2;
			deadPlayers.y = (tileMap.height - deadPlayers.height) / 2;
			
			bulletGroup = new BulletGroup();
			
			player = new Player();
			player.reset((tileMap.width - player.width) / 2, (tileMap.height - player.height) / 2);
			player.bulletGroup = bulletGroup;
			
			enemyGroup = new EnemyGroup();
			enemyGroup.add(player);
			
			FlxG.camera.follow(player);
			tileMap.follow(FlxG.camera, 1);
			
			add(tileMap);
			add(deadPlayers);
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
			} else if (FlxG.keys.justPressed("TWO")) {
				var e02:Enemy02 = enemyGroup.recycle(Enemy02) as Enemy02;
				e02.player = player;
				e02.reset(FlxG.mouse.x, FlxG.mouse.y);
			} else if (FlxG.keys.justPressed("THREE")) {
				var m:Mushr = new Mushr();
				m.player = player;
				enemyGroup.add(m);
			}
			super.update();
			
			FlxG.collide(player, tileMap);
			FlxG.overlap(bulletGroup, enemyGroup, ovBulletEnemy);
			FlxG.overlap(player, enemyGroup, ovPlayerEnemy);
			
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
		
		private function ovPlayerEnemy(o1:FlxObject, o2:FlxObject):void
		{
			if (o2 is Enemy) {
				player.kill();
				FlxG.play(Snd.DEATH02);
				FlxG.fade(FlxG.BLACK, 1, FlxG.resetState);
			}
		}
		
	}

}