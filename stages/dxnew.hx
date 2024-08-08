import flixel.FlxCamera;

EngineSettings.maxRatingsAllowed = 0;
EngineSettings.showTimer = false;

var camMain;
var camDX;
var stage:Stage = null;
function create() {
	FlxG.resizeWindow(1024, 768);
	FlxG.scaleMode.width = 1280;
	FlxG.scaleMode.height = 960;
	FlxG.scaleMode.isWidescreen = false;

	stage = loadStage('dxnew');

	camDX = new FlxCamera(0, 0, 3000);
    camDX.bgColor = 0x00ffffff;
    FlxG.cameras.add(camDX);

	camMain = new FlxCamera();
    camMain.bgColor = 0x00ffffff;
    FlxG.cameras.add(camMain);
	
	for (obj in [stage.getSprite("frontbg"), dad, boyfriend])
		obj.cameras = [camMain];

	camDX.addShader(new CustomShader(Paths.shader("dx")));
}

function createPost() {
	FlxG.cameras.add(camHUD, false);

	for (obj in [scoreTxt, healthBarBG, healthBar, iconP1, iconP2])
		obj.kill();

	for (note in unspawnNotes)
		if (!note.mustPress)
			note.cameras = [camDX];

	var strumIndex = -1;

	for (strum in cpuStrums.members) {
		strumIndex++;

		strum.angle = 90;
		strum.setPosition(1900, 1250 + (85 * strumIndex));
	}
}

function update(elapsed) {
	stage.update(elapsed);

	camDX.scroll.x = FlxG.camera.scroll.x;
	camDX.scroll.y = FlxG.camera.scroll.y;
	camDX.zoom = FlxG.camera.zoom;

	camMain.scroll.x = FlxG.camera.scroll.x;
	camMain.scroll.y = FlxG.camera.scroll.y;
	camMain.zoom = FlxG.camera.zoom;

	if (FlxG.keys.justPressed.SEVEN) {
		FlxG.resizeWindow(1280, 720);
		FlxG.scaleMode.width = 1280;
		FlxG.scaleMode.height = 720;
		FlxG.scaleMode.isWidescreen = false;
	}
}

function updatePost(elapsed) {
	if (PlayState.section != null && PlayState.section.mustHitSection) {
		PlayState.defaultCamZoom = 0.92;
	} else {
		if (curStep > 815)
			PlayState.defaultCamZoom = 0.75;
		else
			PlayState.defaultCamZoom = 1.12;
	}
}

var boingySproingy:Bool = false;
var poopFartShittay:Float = 1.25;
var camRight:Bool = true;

function stepHit(curStep) {
	boingySproingy = curStep > 560;

	if (boingySproingy) {
		if (curStep % 4 == 0) {
			FlxTween.tween(PlayState.camHUD, {y: 0}, 0.2, {ease: FlxEase.circOut});
		}
		if (curStep % 4 == 2) {
			FlxTween.tween(PlayState.camHUD, {y: 15}, 0.2, {ease: FlxEase.sineIn});
		}
	}
}

function beatHit(curBeat) {
	stage.onBeat();

	if (curBeat == 72) {
		for (obj in [stage.getSprite("sky"), stage.getSprite("backbg")])
			FlxTween.color(obj, 2, 0xFFFFFFFF, 0xFFFFAAAA, {ease: FlxEase.quadInOut});
	}

	if (boingySproingy) {
		PlayState.autoCamZooming = false;
		if (curBeat % 2 == 0) {
			if (!camRight) {
				poopFartShittay = -1.25;
				camRight = true;
			} else {
				poopFartShittay = 1.25;
				camRight = false;
			}

			camHUD.zoom += 0.02;
			camHUD.angle = poopFartShittay;
			FlxTween.tween(camHUD, {angle: 0}, 0.5, {ease: FlxEase.quadInOut});
			FlxTween.tween(camHUD, {zoom: 1}, 0.5, {ease: FlxEase.quadInOut});
		}
	}
}