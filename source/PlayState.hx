package;

import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.FlxG;


class PlayState extends FlxState
{

	var _bg:Background;
	var _btnPlay:FlxButton;
	var _player:Player;
	var _policia:Policia;

	override public function create():Void
	{
		_bg = new Background();
		add(_bg);
		
		_player = new Player(20, 20);
		_player.scale.set(0.3,0.3);
 		add(_player);

		_policia = new Policia(120, 120);
 		add(_policia);

		_btnPlay = new FlxButton(200, 3, "Voltar", clickVoltar);
        add(_btnPlay);

		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}

	function clickVoltar():Void
    {
        FlxG.switchState(new MenuState());
    }
}
