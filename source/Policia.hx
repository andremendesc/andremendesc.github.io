package;

import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.math.FlxPoint;
import flixel.FlxG;
import flixel.FlxObject;

class Policia extends FlxSprite
{

    public function new(?X:Float=0, ?Y:Float=0)
    {
        super(X, Y);
        loadGraphic(AssetPaths.officer_unboxed__png, true, 32, 32);
        drag.x = drag.y = 1600;
        setFacingFlip(FlxObject.RIGHT, false, false);
        setFacingFlip(FlxObject.LEFT, true, false);
        animation.add("lr", [10, 11, 12, 13, 14, 15, 16], 12, false);
        animation.add("u", [10, 11, 12, 13, 14, 15, 16], 12, false);
        animation.add("d", [16, 15, 14, 13, 12, 11, 10], 12, false);
    }

    override public function update(elapsed:Float):Void
    {
        movement();
        super.update(elapsed);
    }

    function movement():Void
    {
        var _up:Bool = false;
        var _down:Bool = false;
        var _left:Bool = false;
        var _right:Bool = false;

        //Primeiro fazer ele andar por aí sem regra..
    }
}