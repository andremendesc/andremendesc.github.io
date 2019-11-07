package;

import flixel.FlxState;
import flixel.ui.FlxButton;
import flixel.FlxG;
import flixel.FlxSprite;

class MenuState extends FlxState 
{
    var _btnPlay:FlxButton;
    var _sprtLol:FlxSprite;

	override public function create():Void
	{
		super.create();
        _btnPlay = new FlxButton(110, 250, "Começar", clickPlay);
        add(_btnPlay);
        _sprtLol = new FlxSprite(0, 0, AssetPaths.lol__jpg);
        _sprtLol.screenCenter();
        add(_sprtLol);
        FlxG.sound.playMusic("anightofdizzyspellssmaller");
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}

    function clickPlay():Void
    {
        FlxG.switchState(new PlayState());
    }
}