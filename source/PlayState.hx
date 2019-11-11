package;

import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.FlxG;
import flixel.addons.editors.ogmo.FlxOgmoLoader;
import flixel.tile.FlxTilemap;
import flixel.FlxObject;


class PlayState extends FlxState
{

	var _bg:Background;
	var _btnPlay:FlxButton;
	var _player:Player;
	var _map:FlxOgmoLoader;
	var _mWalls:FlxTilemap;
	var _policia:Policia;

	override public function create():Void
	{
		_bg = new Background();
		add(_bg);

		_map = new FlxOgmoLoader(AssetPaths.level2__oel);
		_mWalls = _map.loadTilemap(AssetPaths.brick_tiles_1__png, 16, 16, "walls");
		_mWalls.follow();
		_mWalls.setTileProperties(17, FlxObject.NONE);
		_mWalls.setTileProperties(0, FlxObject.ANY);
		_mWalls.setTileProperties(1, FlxObject.ANY);
		_mWalls.setTileProperties(14, FlxObject.ANY);
		_mWalls.setTileProperties(15, FlxObject.ANY);
		_mWalls.setTileProperties(9, FlxObject.ANY);
		add(_mWalls);
		
		_player = new Player();
		_player.scale.set(0.05, 0.05);
		_player.updateHitbox();
		_map.loadEntities(placeEntities, "entities");
 		add(_player);

		_policia = new Policia(120, 120);
		_policia.scale.set(2.5, 2.5);
		_policia.updateHitbox();
 		add(_policia);

		_btnPlay = new FlxButton(200, 3, "Voltar", clickVoltar);
		add(_btnPlay);

		FlxG.camera.follow(_player, TOPDOWN, 1);

		super.create();
	}
	
	function placeEntities(entityName:String, entityData:Xml):Void
	{
		var x:Int = Std.parseInt(entityData.get("x"));
		var y:Int = Std.parseInt(entityData.get("y"));
		if (entityName == "player")
		{
			_player.x = x;
			_player.y = y;
		}
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		FlxG.collide(_player, _mWalls);
	}

	function clickVoltar():Void
	{
		FlxG.switchState(new MenuState());
	}
}
