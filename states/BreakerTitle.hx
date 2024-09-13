import Conductor;
import flixel.util.FlxTimer;

var coolText;
var gayNum = 0;
var goingIntoShit = false;

function create() {
	FlxG.sound.playMusic(Paths.music('sdxnew'));
	Conductor.changeBPM(132);

	var dx = new FlxSprite().loadGraphic(Paths.image('menu/title/dx'));
	dx.screenCenter();
	dx.updateHitbox();
	dx.antialiasing = true;
	FlxTween.tween(dx.scale, {x: -1}, 1, {ease: FlxEase.cubeInOut, type: 4});
	FlxTween.tween(dx, {y: dx.y - 25}, 1, {ease: FlxEase.cubeInOut, type: 4});
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

	var enterText = new FlxSprite(-35, 430).loadGraphic(Paths.image('menu/title/enter'));
	enterText.scale.set(0.25, 0.25);
	enterText.updateHitbox();
	enterText.antialiasing = true;
	FlxTween.tween(enterText, {y: 440, angle: 5}, 0.2, {ease: FlxEase.cubeInOut, type: 4});
	add(enterText);
}

function createPost() {
	titleText.visible = false;
}

function update(elapsed:Float) {
	if (!goingIntoShit) {
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
			goingIntoShit = true;
			FlxG.sound.play(Paths.sound("UwU"));
			FlxG.camera.flash(0xff9f0000, 0.85);
			new FlxTimer().start(1.3, function() {
				FlxG.switchState(new MainMenuState());
			});
		}
	}

	Conductor.songPosition = FlxG.sound.music.time;
}

function beatHit() {
	/*if (dx.angle != 15)
		FlxTween.tween(dx, {angle: 15}, 0.2, {ease: FlxEase.smootherStepOut});
		  else
		FlxTween.tween(dx, {angle: -15}, 0.2, {ease: FlxEase.smootherStepOut}); */

	if (curBeat % 2 == 0) {
		coolText.scale.set(0.26, 0.26);
		FlxTween.tween(coolText.scale, {x: 0.25, y: 0.25}, 0.2, {ease: FlxEase.elasticInOut});
	}
}

function gayify() {
	FlxG.sound.play(Paths.sound("gay"));
	FlxG.camera.addShader(new CustomShader(Paths.shader("rainbow")));
	FlxG.camera.flash(0xFFffffff, 0.45);
	FlxG.sound.playMusic(Paths.music('eek!'));
	Conductor.changeBPM(110);
}
