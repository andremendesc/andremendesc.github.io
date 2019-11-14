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

	override public function create():Void
	{
		_bg = new Background();
		add(_bg);

		_map = new FlxOgmoLoader(AssetPaths.level4__oel);
		_mForeground = _map.loadTilemap(AssetPaths.tilemap_packed__png, 16, 16, "foreground");
		_mForeground.follow();
		_mForeground.setTileProperties(0, FlxObject.ANY);
		_mForeground.setTileProperties(1, FlxObject.ANY);
		_mForeground.setTileProperties(2, FlxObject.ANY);
		_mForeground.setTileProperties(3, FlxObject.ANY);
		_mForeground.setTileProperties(4, FlxObject.ANY);
		_mForeground.setTileProperties(5, FlxObject.ANY);
		_mForeground.setTileProperties(6, FlxObject.ANY);
		_mForeground.setTileProperties(8, FlxObject.ANY);
		_mForeground.setTileProperties(9, FlxObject.ANY);
		_mForeground.setTileProperties(10, FlxObject.ANY);
		_mForeground.setTileProperties(11, FlxObject.ANY);
		_mForeground.setTileProperties(12, FlxObject.ANY);
		_mForeground.setTileProperties(13, FlxObject.ANY);
		_mForeground.setTileProperties(14, FlxObject.ANY);
		_mForeground.setTileProperties(15, FlxObject.ANY);
		_mForeground.setTileProperties(27, FlxObject.ANY);
		_mForeground.setTileProperties(28, FlxObject.ANY);
		_mForeground.setTileProperties(35, FlxObject.ANY);
		_mForeground.setTileProperties(36, FlxObject.ANY);
		_mForeground.setTileProperties(37, FlxObject.ANY);
		_mForeground.setTileProperties(38, FlxObject.ANY);
		_mForeground.setTileProperties(39, FlxObject.ANY);
		_mForeground.setTileProperties(40, FlxObject.ANY);
		_mForeground.setTileProperties(41, FlxObject.ANY);
		_mForeground.setTileProperties(42, FlxObject.ANY);
		_mForeground.setTileProperties(62, FlxObject.ANY);
		_mForeground.setTileProperties(63, FlxObject.ANY);
		_mForeground.setTileProperties(64, FlxObject.ANY);
		_mForeground.setTileProperties(65, FlxObject.ANY);
		_mForeground.setTileProperties(66, FlxObject.ANY);
		_mForeground.setTileProperties(67, FlxObject.ANY);
		_mForeground.setTileProperties(68, FlxObject.ANY);
		_mForeground.setTileProperties(69, FlxObject.ANY);
		_mForeground.setTileProperties(405, FlxObject.ANY);
		_mForeground.setTileProperties(406, FlxObject.ANY);
		_mForeground.setTileProperties(432, FlxObject.ANY);
		_mForeground.setTileProperties(433, FlxObject.ANY);
		_mForeground.setTileProperties(434, FlxObject.ANY);
		_mForeground.setTileProperties(435, FlxObject.ANY);
		_mForeground.setTileProperties(436, FlxObject.ANY);
		_mForeground.setTileProperties(437, FlxObject.ANY);
		_mForeground.setTileProperties(438, FlxObject.ANY);
		_mForeground.setTileProperties(439, FlxObject.ANY);
		_mForeground.setTileProperties(440, FlxObject.ANY);
		_mForeground.setTileProperties(441, FlxObject.ANY);
		_mForeground.setTileProperties(441, FlxObject.ANY);
		_mForeground.setTileProperties(460, FlxObject.ANY);
		_mForeground.setTileProperties(461, FlxObject.ANY);
		_mForeground.setTileProperties(462, FlxObject.ANY);
		_mForeground.setTileProperties(463, FlxObject.ANY);
		_mForeground.setTileProperties(464, FlxObject.ANY);
		_mForeground.setTileProperties(465, FlxObject.ANY);
		_mForeground.setTileProperties(466, FlxObject.ANY);
		_mForeground.setTileProperties(467, FlxObject.ANY);
		_mForeground.setTileProperties(468, FlxObject.ANY);
		add(_mForeground);

		_mWalls = _map.loadTilemap(AssetPaths.PathAndObjects__png, 16, 16, "walls");
		add(_mWalls);

		_mForeground2 = _map.loadTilemap(AssetPaths.tilemap_packed__png, 16, 16, "foreground2");
		_mForeground2.follow();
		_mForeground2.setTileProperties(315, FlxObject.ANY);
		_mForeground2.setTileProperties(316, FlxObject.ANY);
		_mForeground2.setTileProperties(317, FlxObject.ANY);
		_mForeground2.setTileProperties(232, FlxObject.ANY);
		_mForeground2.setTileProperties(259, FlxObject.ANY);
		_mForeground2.setTileProperties(449, FlxObject.ANY);
		_mForeground2.setTileProperties(342, FlxObject.ANY);
		_mForeground2.setTileProperties(343, FlxObject.ANY);
		_mForeground2.setTileProperties(344, FlxObject.ANY);
		_mForeground2.setTileProperties(398, FlxObject.ANY);
		_mForeground2.setTileProperties(164, FlxObject.ANY);
		_mForeground2.setTileProperties(471, FlxObject.ANY);
		add(_mForeground2);

		_player = new Player();
		_player.scale.set(0.035, 0.035);
		_player.updateHitbox();
		_map.loadEntities(placeEntities, "entities");
 		add(_player);

		_policia = new Policia(120, 120);
		_policia.scale.set(1.5, 1.5);
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
