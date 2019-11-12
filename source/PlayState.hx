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

		_map = new FlxOgmoLoader(AssetPaths.level3__oel);
		_mWalls = _map.loadTilemap(AssetPaths.tilemap_packed__png, 16, 16, "walls");
		_mWalls.follow();
		_mWalls.setTileProperties(0, FlxObject.NONE);
		_mWalls.setTileProperties(1, FlxObject.NONE);
		_mWalls.setTileProperties(2, FlxObject.NONE);
		_mWalls.setTileProperties(3, FlxObject.NONE);
		_mWalls.setTileProperties(4, FlxObject.NONE);
		_mWalls.setTileProperties(5, FlxObject.NONE);
		_mWalls.setTileProperties(6, FlxObject.NONE);
		_mWalls.setTileProperties(8, FlxObject.NONE);
		_mWalls.setTileProperties(9, FlxObject.NONE);
		_mWalls.setTileProperties(10, FlxObject.NONE);
		_mWalls.setTileProperties(11, FlxObject.NONE);
		_mWalls.setTileProperties(12, FlxObject.NONE);
		_mWalls.setTileProperties(13, FlxObject.NONE);
		_mWalls.setTileProperties(14, FlxObject.NONE);
		_mWalls.setTileProperties(15, FlxObject.NONE);
		_mWalls.setTileProperties(27, FlxObject.NONE);
		_mWalls.setTileProperties(28, FlxObject.NONE);
		_mWalls.setTileProperties(35, FlxObject.NONE);
		_mWalls.setTileProperties(36, FlxObject.NONE);
		_mWalls.setTileProperties(37, FlxObject.NONE);
		_mWalls.setTileProperties(38, FlxObject.NONE);
		_mWalls.setTileProperties(39, FlxObject.NONE);
		_mWalls.setTileProperties(40, FlxObject.NONE);
		_mWalls.setTileProperties(41, FlxObject.NONE);
		_mWalls.setTileProperties(42, FlxObject.NONE);
		_mWalls.setTileProperties(62, FlxObject.NONE);
		_mWalls.setTileProperties(63, FlxObject.NONE);
		_mWalls.setTileProperties(64, FlxObject.NONE);
		_mWalls.setTileProperties(65, FlxObject.NONE);
		_mWalls.setTileProperties(66, FlxObject.NONE);
		_mWalls.setTileProperties(67, FlxObject.NONE);
		_mWalls.setTileProperties(68, FlxObject.NONE);
		_mWalls.setTileProperties(69, FlxObject.NONE);
		_mWalls.setTileProperties(405, FlxObject.NONE);
		_mWalls.setTileProperties(406, FlxObject.NONE);
		_mWalls.setTileProperties(432, FlxObject.NONE);
		_mWalls.setTileProperties(433, FlxObject.NONE);
		_mWalls.setTileProperties(434, FlxObject.NONE);
		_mWalls.setTileProperties(435, FlxObject.NONE);
		_mWalls.setTileProperties(436, FlxObject.NONE);
		_mWalls.setTileProperties(437, FlxObject.NONE);
		_mWalls.setTileProperties(438, FlxObject.NONE);
		_mWalls.setTileProperties(439, FlxObject.NONE);
		_mWalls.setTileProperties(440, FlxObject.NONE);
		_mWalls.setTileProperties(441, FlxObject.NONE);
		_mWalls.setTileProperties(441, FlxObject.NONE);
		_mWalls.setTileProperties(460, FlxObject.NONE);
		_mWalls.setTileProperties(461, FlxObject.NONE);
		_mWalls.setTileProperties(462, FlxObject.NONE);
		_mWalls.setTileProperties(463, FlxObject.NONE);
		_mWalls.setTileProperties(464, FlxObject.NONE);
		_mWalls.setTileProperties(465, FlxObject.NONE);
		_mWalls.setTileProperties(466, FlxObject.NONE);
		_mWalls.setTileProperties(467, FlxObject.NONE);
		_mWalls.setTileProperties(468, FlxObject.NONE);
		add(_mWalls);
		
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
