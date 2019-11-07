package;

import flixel.FlxGame;
import openfl.display.Sprite;

class Main extends Sprite
{
	public function new()
	{
		super();
		__buttonMode = true;
		useHandCursor = false;
		addChild(new FlxGame(300, 300, MenuState, 1, 60, 60, true));
	}
}
