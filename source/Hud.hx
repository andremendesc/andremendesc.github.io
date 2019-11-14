package ;

import flixel.group.FlxSpriteGroup;
import flixel.text.FlxText;
import flixel.ui.FlxBar;
import flixel.util.FlxColor;

class Hud extends FlxSpriteGroup
{
	private var totalHp:FlxText;
	private var expBar:FlxBar;
	private var hp:Int;
	private var maxHp:Int;
	private var exp:Float;
	private var maxExp:Int;
	private var level:Int;
	private var levelDisplay:FlxText;

	public function new() 

	{
		super();
		scrollFactor.x = 0;
		scrollFactor.y = 0;

		totalHp = new FlxText(2, 2);
		hp = 5;
		maxHp = 10;
		add(totalHp);

		levelDisplay = new FlxText(2, 12);
		level = 1;
		add(levelDisplay);

		maxExp = 10;
		exp = 50.0;
		expBar = new FlxBar(50, 4, FlxBarFillDirection.LEFT_TO_RIGHT, 50, 10, null, "", 0, 100, true);
		expBar.createFilledBar(0xB3FFA14B, 0xFFFFAA00);
		add(expBar);
	}

	override public function update(elapsed) {
		totalHp.text = "HP: " + hp + "/" + maxHp;
		totalHp.color = FlxColor.RED;
		levelDisplay.text = "Level: " + level;
		levelDisplay.color = 0xff0000;
		expBar.value = exp;
	}

	public function addHealth(num:Int):Void {
		hp += num;
		if (hp > maxHp) {
			hp = maxHp;
		}
	}
}