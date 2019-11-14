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
	var _mForeground:FlxTilemap;
	var _mForeground2:FlxTilemap;
	var _policia:Policia;
	var _barText:FlxText;
	private var hud:Hud;

	override public function create():Void
	{
		_bg = new Background();
		add(_bg);

		_map = new FlxOgmoLoader(AssetPaths.level4__oel);

		_mForeground = _map.loadTilemap(AssetPaths.tilemap_packed__png, 16, 16, "foreground");
		_mForeground.follow();
		_mForeground.setTileProperties(0, FlxObject.NONE, null, null, 15);
		_mForeground.setTileProperties(27, FlxObject.NONE, null, null, 2);
		_mForeground.setTileProperties(35, FlxObject.NONE, null ,null, 7);
		_mForeground.setTileProperties(62, FlxObject.NONE, null, null, 7);
		_mForeground.setTileProperties(405, FlxObject.NONE, null, null, 2);
		_mForeground.setTileProperties(432, FlxObject.NONE, null, null, 10);
		_mForeground.setTileProperties(459, FlxObject.NONE, null, null, 9);
		add(_mForeground);

		_mWalls = _map.loadTilemap(AssetPaths.PathAndObjects__png, 16, 16, "walls");
		add(_mWalls);

		_player = new Player();
		_player.scale.set(0.020, 0.020);
		_player.updateHitbox();
		_player.scale.set(0.035, 0.035);
		_map.loadEntities(placeEntities, "entities");
 		add(_player);

		_mForeground2 = _map.loadTilemap(AssetPaths.tilemap_packed__png, 16, 16, "foreground2");
		_mForeground2.follow();
		_mForeground2.setTileProperties(164, FlxObject.NONE);
		_mForeground2.setTileProperties(232, FlxObject.NONE);
		_mForeground2.setTileProperties(259, FlxObject.ANY);
		_mForeground2.setTileProperties(315, FlxObject.NONE, null, null, 2);
		_mForeground2.setTileProperties(342, FlxObject.ANY, null, null, 2);
		_mForeground2.setTileProperties(391, FlxObject.NONE);
		_mForeground2.setTileProperties(398, FlxObject.ANY);
		_mForeground2.setTileProperties(425, FlxObject.NONE);		
		_mForeground2.setTileProperties(449, FlxObject.ANY);		
		_mForeground2.setTileProperties(471, FlxObject.ANY);
		add(_mForeground2);

		_btnPlay = new FlxButton(200, 3, "Voltar", clickVoltar);
		add(_btnPlay);

		_policia = new Policia(120, 120);
		_policia.scale.set(1.3, 1.3);
		_policia.updateHitbox();
 		add(_policia);

		FlxG.camera.follow(_player, TOPDOWN, 1);

		hud = new Hud();
		add(hud);

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
		FlxG.collide(_player, _mForeground);
		FlxG.collide(_player, _mForeground2);
	}

	function clickVoltar():Void
	{
		FlxG.switchState(new MenuState());
	}
}
