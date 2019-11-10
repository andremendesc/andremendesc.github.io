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

		_map = new FlxOgmoLoader(AssetPaths.level1__oel);
		_mWalls = _map.loadTilemap(AssetPaths.streets__png, 16, 16, "walls");
		_mWalls.follow();
		_mWalls.setTileProperties(469, FlxObject.NONE);
		_mWalls.setTileProperties(52, FlxObject.ANY);
		_mWalls.setTileProperties(53, FlxObject.ANY);
		_mWalls.setTileProperties(54, FlxObject.ANY);
		_mWalls.setTileProperties(56, FlxObject.ANY);
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
