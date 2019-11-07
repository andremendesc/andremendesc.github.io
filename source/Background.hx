package;

import flixel.FlxSprite;
import flixel.util.FlxColor;

class Background extends FlxSprite
{

    public function new(?X:Float=0, ?Y:Float=0)
    {
        super(X, Y);
        makeGraphic(300, 300, FlxColor.BLUE);
    }

}