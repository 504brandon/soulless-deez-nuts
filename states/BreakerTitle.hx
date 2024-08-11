import Conductor;
import flixel.util.FlxTimer;

var dx;
var coolText;
var enterText;
var gayNum = 0;

function create() {
	FlxG.sound.playMusic(Paths.music('sdxnew'));
	Conductor.changeBPM(132);

	dx = new FlxSprite().loadGraphic(Paths.image('menu/title/dx'));
	dx.screenCenter();
	dx.updateHitbox();
	dx.antialiasing = true;
	add(dx);

	var circle = new FlxSprite().loadGraphic(Paths.image('menu/title/omg'));
	circle.screenCenter();
	circle.updateHitbox();
	circle.antialiasing = true;
	add(circle);

	coolText = new FlxSprite(-35, -115).loadGraphic(Paths.image('menu/title/title'));
	coolText.scale.set(0.25, 0.25);
	coolText.updateHitbox();
	coolText.angle = 15;
	coolText.antialiasing = true;
	add(coolText);

	enterText = new FlxSprite(-35, 430).loadGraphic(Paths.image('menu/title/enter'));
	enterText.scale.set(0.25, 0.25);
	enterText.updateHitbox();
	enterText.antialiasing = true;
	add(enterText);
}

function createPost() {
	titleText.visible = false;
}

function update(elapsed:Float) {
	var gayKeys = [FlxG.keys.justPressed.G, FlxG.keys.justPressed.A, FlxG.keys.justPressed.Y];

	var gayIndex = -1;

	for (gaykey in gayKeys) {
		gayIndex++;

		if (gaykey && gayIndex == gayNum) {
			gayNum++;
			trace(gayNum);

			if (gayNum == 3) {
				gayNum = 0;
				FlxG.save.data.gayMode = !FlxG.save.data.gayMode;
				gayify();
			}
		}
	}

    if (controls.ACCEPT) {
        FlxG.sound.play(Paths.sound("UwU"));
        FlxG.camera.flash(0xff9f0000, 0.35);
        new FlxTimer().start(1.3, function() {
            FlxG.switchState(new MainMenuState());
        });
    }

    Conductor.songPosition = FlxG.sound.music.time;
}

function beatHit() {
	/*if (dx.angle != 15)
		FlxTween.tween(dx, {angle: 15}, 0.2, {ease: FlxEase.smootherStepOut});
		  else
		FlxTween.tween(dx, {angle: -15}, 0.2, {ease: FlxEase.smootherStepOut}); */

	coolText.scale.set(0.30, 0.30);
	FlxTween.tween(coolText.scale, {x: 0.25, y: 0.25}, 0.2, {ease: FlxEase.elasticInOut});
}

function gayify() {
	FlxG.sound.play(Paths.sound("gay"));
	FlxG.camera.addShader(new CustomShader(Paths.shader("rainbow")));
	FlxG.camera.flash(0xFFffffff, 0.45);
	FlxG.sound.playMusic(Paths.music('eek!'));
	Conductor.changeBPM(110);
}