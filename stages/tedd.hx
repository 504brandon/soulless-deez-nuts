import flixel.math.FlxMath;
import flixel.util.FlxStringUtil;

EngineSettings.showTimer = false;

var timer;
var songsThatGF = [];

function create() {
    defaultCamZoom = 0.85;

	FlxG.scaleMode.width = 1280;
	FlxG.scaleMode.height = 960;
	FlxG.scaleMode.isWidescreen = false;
	FlxG.resizeWindow(1024, 768);
}

function createPost() {
	if (!songsThatGF.contains(FlxG.state.SONG.song))
		gf.kill();

	for (obj in [healthBar, healthBarBG, iconP1, iconP2, scoreTxt])
		obj.kill();

	var hitedd = new FlxText(-20, 865, FlxG.width, "tedd channel - " + FlxG.state.SONG.song.toLowerCase(), 65);
	hitedd.color = 0xff000000;
	hitedd.font = Paths.font("silly.ttf");
	hitedd.alignment = "right";
	hitedd.cameras = [camHUD];
	add(hitedd);

	timer = new FlxText(0, 0, FlxG.width, "0:00", 65);
	timer.color = 0xff000000;
	timer.font = Paths.font("silly.ttf");
	timer.alignment = "center";
	timer.cameras = [camHUD];
	add(timer);

	FlxG.camera.bgColor = 0xFFffffff;

    /*for (note in unspawnNotes) {
        note.cameras = [camGame];
    }

    for (strum in cpuStrums.members) {
        strum.cameras = [camGame];
	}

	for (strum in playerStrums.members) {
		strum.cameras = [camGame];
	}*/
}

function updatePost(elapsed) {
	if (FlxStringUtil.formatTime(((inst.length) / 1000) - (Conductor.songPosition - ((inst.length) / 1000)) / 1000) < FlxStringUtil.formatTime(((inst.length) / 1000)))
		time = FlxStringUtil.formatTime(((inst.length) / 1000) - (Conductor.songPosition - ((inst.length) / 1000)) / 1000);
	else
		time = FlxStringUtil.formatTime(((inst.length) / 1000));

	timer.text = time;

	timer.angle = FlxMath.lerp(timer.angle, 0, elapsed * 60 * 0.075);
	timer.scale.y = FlxMath.lerp(timer.scale.y, 1, elapsed * 60 * 0.052);

    /*for (strum in playerStrums.members) {
		strum.y = FlxMath.lerp(strum.y, strumLine.y, 0.025);
	}*/
}

var gay = false;

function beatHit() {
	if (curBeat % 2 == 0) {
		gay = !gay;
		timer.angle = if (gay) -20 else 20;
	}

	timer.scale.y += 0.5;
}

function onPlayerHit(n) {
    //playerStrums.members[n.noteData % PlayState.SONG.keyNumber].y -= 25;
}