package;

import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.math.FlxPoint;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.math.FlxVelocity;

class Player extends FlxSprite
{
    public var speed:Float = 200;

    public function new(?X:Float=0, ?Y:Float=0)
    {
        super(X, Y);

        loadGraphic(AssetPaths.running__png, true, 479, 797);

        setSize(8, 14);
        offset.set(4, 2);
        drag.x = drag.y = 1600;

        setFacingFlip(FlxObject.RIGHT, false, false);
        setFacingFlip(FlxObject.LEFT, true, false);
        
        animation.add("idle", [2, 5], 3, true);
        animation.add("lr", [0, 1, 2, 3, 4, 5], 5, true);
        animation.add("u", [2, 5], 3, false);
        animation.add("d", [5, 2], 3, false);
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
        var _angle:Float = 0.0;
        var _pointCurrent:FlxPoint = new FlxPoint(this.x, this.y);

        for (touch in FlxG.touches.list)
        {
            if (touch.justPressed || touch.pressed) {
                FlxVelocity.moveTowardsTouch(this, touch, speed);
                _angle = _pointCurrent.angleBetween(touch.getPosition());
                
                if (_angle >= -180 && _angle < -45) {
                    facing = FlxObject.UP;
                    animation.play("u");
                } else if (_angle >= -45 && _angle < 45) {
                    facing = FlxObject.RIGHT;
                    animation.play("lr");
                } else if (_angle >= 45 && _angle < 135) {
                    facing = FlxObject.DOWN;
                    animation.play("d");
                } else if (_angle >= 135 && _angle < 180) {
                     facing = FlxObject.LEFT;
                     animation.play("lr");
                }
                
            }
            if (touch.justReleased) {
                animation.play("idle");
            }
        }

        _up = FlxG.keys.anyPressed([UP, W]);
        _down = FlxG.keys.anyPressed([DOWN, S]);
        _left = FlxG.keys.anyPressed([LEFT, A]);
        _right = FlxG.keys.anyPressed([RIGHT, D]);

        if (_up && _down)
            _up = _down = false;
        if (_left && _right)
            _left = _right = false;
        if (_up || _down || _left || _right) {

            var mA:Float = 0;

            if (_up) {
                mA = -90; 
                if (_left)
                    mA -= 45; // if the player is also pressing LEFT, subtract 45 degrees from  angle - we're moving up and left
                else if (_right)
                    mA += 45; // similarly, if the player is pressing RIGHT add 45 degrees (up and right)
                facing = FlxObject.UP; 
            } else if (_down) {
                mA = 90;
                if (_left)
                    mA += 45; // add 45 degrees if the player is also pressing LEFT
                else if (_right)
                    mA -= 45; // or subtract 45 if they are pressing RIGHT
                facing = FlxObject.DOWN; // the sprite is facing DOWN
            } else if (_left) { 
                mA = 180; 
                facing = FlxObject.LEFT;
            } else if (_right) {
                mA = 0;
                facing = FlxObject.RIGHT;
            }
            // determine velocity based on angle and speed
            velocity.set(speed, 0);
            velocity.rotate(FlxPoint.weak(0, 0), mA);

            if ((velocity.x != 0 || velocity.y != 0) && touching == FlxObject.NONE) // if the player is moving (velocity is not 0 for either axis), we need to change the animation to match their facing
            {
                switch (facing)
                {
                    case FlxObject.LEFT, FlxObject.RIGHT:
                        animation.play("lr");
                    case FlxObject.UP:
                        animation.play("u");
                    case FlxObject.DOWN:
                        animation.play("d");
                }
            }
        } else {
            animation.play("idle");
        }
    }
}